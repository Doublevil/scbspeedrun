state("SuperCableBoy", "v1.0.4")
{
    long clockFrames : "UnityPlayer.dll", 0x017CD668, 0x1F0, 0x1E8, 0x4E0, 0xDB8, 0xB8, 0xD0, 0x8, 0x68;
	bool freezePlaytimeTimer : "UnityPlayer.dll", 0x017CD668, 0x1F0, 0x1E8, 0x4E0, 0x500, 0, 0xD0, 8, 0x68;
}

// Notes:
// - Clock frames are stored in FrameClock.ellapsedFrames (static field)
// - There are some useful values in PlayerInfo (death count, jump count, currently active cart)
// - The currently active unity scene and loaded level are stored in MetaSceneManager. An instance is initialized when the game launches, and will never change. The address to this instance can be accessed through the "instance" static field. This field is accessed by the GetInstance static method.
// - Level clock time is in WellDoneManager. An instance of this class is spawned on level load (or when restarting a level after dying for example), but you can find the address of the active instance in the static field "WellDoneManager.instance". This field is accessed by the GetInstance static method.

// MetaSceneManager.currentUnityScene can take the following values:
// 2: Playing the Sorb Games logo animation when starting the game
// 3: Main menu
// 4: World map
// -1: Currently playing a level

startup {
    vars.metaSceneManagerScanTarget = new SigScanTarget(0,
	    "41 FF D3 85 C0 74 24 48 B8 ?? ?? ?? ?? ?? ?? ?? ?? 48 8B 00 48 8B C8 83 38 00 48 8D 6D 00 49 BB ?? ?? ?? ?? ?? ?? ?? ?? 41 FF D3 48 8B 75 F8 48 8D 65 00 5D C3");
	vars.metaSceneManagerStaticInstancePtr = IntPtr.Zero;
	vars.metaSceneManagerFound = false;
	
	settings.Add("anyp_worlds", true, "Split when starting the first level of a new world");
	
	vars.worldEntries = new List<string>() {"tower_entry", "cloud0", "factory_entry", "powerplants0", "crystal_entry", "firewall_entry", "core_entry", "GlitchFight"};
	vars.currentWorldEntry = 0;
}

// Called when the game process is found
init
{
	print("Initializing Super Cable Boy Auto Split");
    refreshRate = 60;
    version = "v1.0.4";
	
	vars.metaSceneManagerStaticInstancePtr = IntPtr.Zero;
	vars.currentWorldEntry = 0;
	vars.metaSceneManagerFound = false;
	
	// Find some method code that can get us to the MetaSceneManager.instance static field address
	var metaSceneManagerGetInstanceMethodPtr = IntPtr.Zero;
	foreach (var page in game.MemoryPages(true).Reverse()) {
		var scanner = new SignatureScanner(game, page.BaseAddress, (int)page.RegionSize);
		metaSceneManagerGetInstanceMethodPtr = scanner.Scan(vars.metaSceneManagerScanTarget);
		if (metaSceneManagerGetInstanceMethodPtr != IntPtr.Zero)
		    break;
    }
	
	// From there, find the reference to the static instance address,
	// which is 9 bytes after the start of the code signature.
	vars.metaSceneManagerStaticInstancePtr = game.ReadValue<IntPtr>(metaSceneManagerGetInstanceMethodPtr + 0x9);
	
	if (vars.metaSceneManagerStaticInstancePtr == IntPtr.Zero) {
		// We could not localize the pointer. This might be due to the game
		// still loading stuff in.
        // As an ugly workaround to prevent the script to continue when the
		// initialization didn't work, and to prevent it to use too much resource,
		// we sleep and throw an exception to start over.
        Thread.Sleep(1000);
        throw new Exception("Could not localize the MetaSceneManager pointer (yet). We will be re-trying.");
    }
	
	print("MetaSceneManager.instance is " + vars.metaSceneManagerStaticInstancePtr.ToString("X"));
	
	vars.watchers = new MemoryWatcherList();
}

// Called every tick.
update {
	// If we have not found metaSceneManager yet, we want to find it
	if (vars.metaSceneManagerFound == false)
	{
		if (vars.metaSceneManagerStaticInstancePtr == IntPtr.Zero)
		{
			// If the static pointer hasn't been found in init, we can't do anything.
			return false;
		}
		
		// A pointer to a static field (MetaSceneManager.instance) contains a pointer to the actual instance of the class. Try to read that.
		var instancePtr = game.ReadValue<IntPtr>((IntPtr)vars.metaSceneManagerStaticInstancePtr);
		
		if (instancePtr != IntPtr.Zero)
		{
			// The pointer to the instance has been found.
			// Now we can start observing the interesting values in there.
			print("The actual instance of MetaSceneManager is " + instancePtr.ToString("X"));
			vars.currentUnityScene = new MemoryWatcher<int>(instancePtr + 0x48);
			vars.currentLevelEntry = new StringWatcher(new DeepPointer(instancePtr + 0x20, 0x10, 0x14), ReadStringType.UTF16, 40);
			vars.watchers.Add(vars.currentUnityScene);
			vars.watchers.Add(vars.currentLevelEntry);
			
			vars.metaSceneManagerFound = true;
		}
	}
	
	// Regular update
	vars.watchers.UpdateAll(game);
	
	if (vars.currentUnityScene.Changed) {
		print("CurrentUnityScene : " + vars.currentUnityScene.Current);
	}
		
	if (vars.currentLevelEntry.Changed) {
		print("Current Level : " + vars.currentLevelEntry.Current);
	}
	
	// Reset stuff when starting a run
	if (current.clockFrames <= 10 && (vars.currentUnityScene.Current == -1 || vars.currentUnityScene.Current == 4))
	{
		vars.currentWorldEntry = 0;
	}
}

// Called every tick when the timer is not started yet.
// When we return true, the timer starts.
start {
	// We need to have everything initialized
	return vars.metaSceneManagerFound == true
		// We need the clock to be under a certain threshold (say, under 10 frames)
		&& current.clockFrames <= 10
		// We need to be either on the map or in a level, otherwise the timer would start in the main menu.
		&& (vars.currentUnityScene.Current == -1 || vars.currentUnityScene.Current == 4);
}

// Called every tick when the timer is running.
// When we return true, we go to the next split.
split {
	// World split: split when changing level to the next value in the world table
	if (vars.currentLevelEntry.Changed
		&& vars.currentWorldEntry < vars.worldEntries.Count
		&& vars.worldEntries[vars.currentWorldEntry] == vars.currentLevelEntry.Current)
	{
		print("New world reached. Splitting.");
		// Increment the current world entry to point to the next world
		vars.currentWorldEntry = vars.currentWorldEntry + 1;
		return true;
	}
	
	// Game over split: split when the timer freezes in the GlitchFight level
	if (vars.currentWorldEntry >= vars.worldEntries.Count
	    && current.freezePlaytimeTimer
		&& vars.currentLevelEntry.Current == "GlitchFight")
	{
		print("Run finished! Congrats!");
		return true;
	}
}

// Called every tick when the timer is running.
// When we return true, the run is reset.
reset {
	// When the script is completely initialized
	return vars.metaSceneManagerFound == true
		// When we reach the main menu
	    && vars.currentUnityScene.Current == 3;
}

// Called every tick when the timer is running.
// When we return true, the timer is suspended.
isLoading {
	// If the in-game clock didn't move on this tick, consider the game paused
	return current.clockFrames == old.clockFrames;
}

// Called every tick when the timer runs.
// The timer will display the timespan we return here.
gameTime {
	// The in-game timer just counts frames, assuming 60FPS.
	// Just divide by 60 and you get the seconds.
	return TimeSpan.FromSeconds((float)current.clockFrames/60);
}