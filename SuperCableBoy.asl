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
	
	settings.Add("dream0", false, "Split on HelloWorld");
	settings.Add("dream1", false, "Split on SL0");
	settings.Add("dream2", false, "Split on SL1");
	settings.Add("dream3", false, "Split on SL2");
	settings.Add("dream4", false, "Split on SL3");
	settings.Add("dream5", false, "Split on SL4");
	settings.Add("dream6", false, "Split on SL5");
	settings.Add("badDream", false, "Split on KernelPanic (SL)");
	settings.Add("tower_entry", true, "Split on T");
	settings.Add("tower0", false, "Split on T0");
	settings.Add("tower1", false, "Split on T1");
	settings.Add("tower2", false, "Split on T2");
	settings.Add("tower3", false, "Split on T3");
	settings.Add("tower4", false, "Split on T4");
	settings.Add("tower5", false, "Split on T5");
	settings.Add("cloud0", true, "Split on C0");
	settings.Add("cloud1", false, "Split on C1");
	settings.Add("cloud2", false, "Split on C2");
	settings.Add("cloud3", false, "Split on C3");
	settings.Add("cloud4", false, "Split on C4");
	settings.Add("cloud5", false, "Split on C5");
	settings.Add("cloud6", false, "Split on C6");
	settings.Add("cloud7", false, "Split on C7");
	settings.Add("cloudTemple", false, "Split on Mr Suihanki");
	settings.Add("cableCart", false, "Split on CableCart");
	settings.Add("factory_entry", true, "Split on A");
	settings.Add("factory0", false, "Split on A0");
	settings.Add("factory1", false, "Split on A1");
	settings.Add("factory2", false, "Split on A2");
	settings.Add("factory3", false, "Split on A3");
	settings.Add("factory4", false, "Split on A4");
	settings.Add("factory5", false, "Split on A5");
	settings.Add("factory_crossing", false, "Split on AC");
	settings.Add("factory6", false, "Split on A6");
	settings.Add("factory7", false, "Split on A7");
	settings.Add("factory8", false, "Split on A8");
	settings.Add("factory9", false, "Split on A9");
	settings.Add("factory_crossing2", false, "Split on AC2");
	settings.Add("factoryX0", false, "Split on AX0");
	settings.Add("factoryX1", false, "Split on AX1");
	settings.Add("factoryX2", false, "Split on AX2");
	settings.Add("factoryX3", false, "Split on AX3");
	settings.Add("factoryX4", false, "Split on AX4");
	settings.Add("factoryX5", false, "Split on AX5");
	settings.Add("factoryX6", false, "Split on AX6");
	settings.Add("factoryX7", false, "Split on AX7");
	settings.Add("factoryY0", false, "Split on AY0");
	settings.Add("factoryY1", false, "Split on AY1");
	settings.Add("factoryY2", false, "Split on AY2");
	settings.Add("factoryY3", false, "Split on AY3");
	settings.Add("factoryY4", false, "Split on AY4");
	settings.Add("factoryY5", false, "Split on AY5");
	settings.Add("factoryBoss", false, "Split on The Disassembler");
	settings.Add("tripleJumpCart", false, "Split on JumpCart");
	settings.Add("powerplants0", true, "Split on PP0");
	settings.Add("powerplants1", false, "Split on PP1");
	settings.Add("powerplants2", false, "Split on PP2");
	settings.Add("powerplants3", false, "Split on PP3");
	settings.Add("powerplants4", false, "Split on PP4");
	settings.Add("powerplants5", false, "Split on PP5");
	settings.Add("powerplants6", false, "Split on PP6");
	settings.Add("powerplants7", false, "Split on PP7");
	settings.Add("powerplants8", false, "Split on PP8");
	settings.Add("powerplants9", false, "Split on PP9");
	settings.Add("powerplants10", false, "Split on PP10");
	settings.Add("powerplants11", false, "Split on PP11");
	settings.Add("powerplants12", false, "Split on PP12");
	settings.Add("powerplants13", false, "Split on PP13");
	settings.Add("powerplants14", false, "Split on PP14");
	settings.Add("powerplantsBoss", false, "Split on The Tessla Coil");
	settings.Add("inkCart", false, "Split on InkCart");
	settings.Add("crystal_entry", true, "Split on LCD");
	settings.Add("crystal0", false, "Split on LCD0");
	settings.Add("crystal1", false, "Split on LCD1");
	settings.Add("crystal2", false, "Split on LCD2");
	settings.Add("crystal3", false, "Split on LCD3");
	settings.Add("crystal4", false, "Split on LCD4");
	settings.Add("crystal5", false, "Split on LCD5");
	settings.Add("crystal6", false, "Split on LCD6");
	settings.Add("crystal7", false, "Split on LCD7");
	settings.Add("crystal8", false, "Split on LCD8");
	settings.Add("crystal9", false, "Split on LCD9");
	settings.Add("crystal10", false, "Split on LCD10");
	settings.Add("crystal11", false, "Split on LCD11");
	settings.Add("crystal12", false, "Split on LCD12");
	settings.Add("crystal13", false, "Split on LCD13");
	settings.Add("crystalBoss", false, "Split on The Quartz Crystal");
	settings.Add("voltageCart", false, "Split on VoltageCart");
	settings.Add("crystalTransition", false, "Split on LCDTransition");
	settings.Add("firewall_entry", true, "Split on FW");
	settings.Add("firewall0", false, "Split on FW0");
	settings.Add("firewall1", false, "Split on FW1");
	settings.Add("firewall2", false, "Split on FW2");
	settings.Add("firewall3", false, "Split on FW3");
	settings.Add("firewall4", false, "Split on FW4");
	settings.Add("firewall5", false, "Split on FW5");
	settings.Add("firewall6", false, "Split on FW6");
	settings.Add("firewall7", false, "Split on FW7");
	settings.Add("firewall8", false, "Split on FW8");
	settings.Add("firewall9", false, "Split on FW9");
	settings.Add("firewall10", false, "Split on FW10");
	settings.Add("firewall11", false, "Split on FW11");
	settings.Add("firewallBoss", false, "Split on The Blacklister");
	settings.Add("core_entry", true, "Split on CORE");
	settings.Add("core0", false, "Split on CORE0");
	settings.Add("core1", false, "Split on CORE1");
	settings.Add("core2", false, "Split on CORE2");
	settings.Add("core3", false, "Split on CORE3");
	settings.Add("core4", false, "Split on CORE4");
	settings.Add("core5", false, "Split on CORE5");
	settings.Add("core6", false, "Split on CORE6");
	settings.Add("core7", false, "Split on CORE7");
	settings.Add("core8", false, "Split on CORE8");
	settings.Add("core9", false, "Split on CORE9");
	settings.Add("core10", false, "Split on CORE10");
	settings.Add("core_transition", false, "Split on CoreTransition");
	settings.Add("GlitchEntry", false, "Split on KernelPanic (CORE)");
	settings.Add("GlitchFight", true, "Split on The Glitch");
	settings.Add("GlitchFight_END", true, "Split when destroying/joining The Glitch");
	settings.Add("ram0", true, "Split on RAM0");
	settings.Add("ram1", false, "Split on RAM1");
	settings.Add("ram2", false, "Split on RAM2");
	settings.Add("ram3", false, "Split on RAM3");
	settings.Add("nullcart", false, "Split on NullCart");
	settings.Add("hackedcloud0", true, "Split on HC0");
	settings.Add("hackedcloud1", false, "Split on HC1");
	settings.Add("hackedcloud2", false, "Split on HC2");
	settings.Add("hackedcloud3", false, "Split on HC3");
	settings.Add("hackedcloudending", false, "Split on Cloud Hopper");
	settings.Add("stackoverflow0", true, "Split on SO0");
	settings.Add("stackoverflow1", false, "Split on SO1");
	settings.Add("stackoverflow2", false, "Split on SO2");
	settings.Add("stackoverflow3", false, "Split on SO3");
	settings.Add("stackoverflowTop", false, "Split on SOTop");
	settings.Add("diskspace0", true, "Split on FS0");
	settings.Add("diskspace1", false, "Split on FS1");
	settings.Add("diskspace2", false, "Split on FS2");
	settings.Add("diskspaceend", false, "Split on EoF");
	settings.Add("diskspaceend_END", true, "Split on reaching EoF");
	settings.Add("pipeline_entry", false, "Split on P");
	settings.Add("pipeline0", false, "Split on P0");
	settings.Add("pipeline1", false, "Split on P1");
	settings.Add("pipeline2", false, "Split on P2");
	settings.Add("pipeline3", false, "Split on P3");
	settings.Add("pipeline4", false, "Split on P4");
	settings.Add("pipeline5", false, "Split on P5");
	settings.Add("pipeline6", false, "Split on P6");
	settings.Add("pipelineending", false, "Split on Streamlined");
}

// Called when the game process is found
init
{
	print("Initializing Super Cable Boy Auto Split");
    refreshRate = 60;
    version = "v1.0.4";
	
	vars.metaSceneManagerStaticInstancePtr = IntPtr.Zero;
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
	
	vars.alreadySplitOnGlitchEnd = false;
	vars.alreadySplitOnEofEnd = false;
	vars.splitPointList = new List<string>();
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
	    print("Resetting run vars");
		vars.splitPointList = new List<string>();
		vars.alreadySplitOnGlitchEnd = false;
		vars.alreadySplitOnEofEnd = false;
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
	// Level split: split when changing level to a value that matches one of the checked settings key
	// If the level is already in the splitPointList, don't split - we have already split on this level
	if ((vars.currentLevelEntry.Changed || vars.currentUnityScene.Changed) && settings[vars.currentLevelEntry.Current]
	    && !vars.splitPointList.Contains(vars.currentLevelEntry.Current))
	{
		print("Splitting on " + vars.currentLevelEntry.Current);
		// Add the level to the list so that we don't split again if we re-enter the level
		vars.splitPointList.Add(vars.currentLevelEntry.Current);
		return true;
	}
	
	// Glitch ending split: split when the timer freezes in the GlitchFight level
	if (!vars.alreadySplitOnGlitchEnd
	    && settings["GlitchFight_END"]
	    && current.freezePlaytimeTimer
		&& vars.currentLevelEntry.Current == "GlitchFight")
	{
		print("Splitting on Glitch ending! Congrats!");
		vars.alreadySplitOnGlitchEnd = true;
		return true;
	}
	
	// EoF ending split: split when the timer freezes in the EoF level
	if (!vars.alreadySplitOnEofEnd
	    && settings["diskspaceend_END"]
	    && current.freezePlaytimeTimer
		&& vars.currentLevelEntry.Current == "diskspaceend")
	{
		print("Splitting on EoF ending! Much congrats!");
		vars.alreadySplitOnEofEnd = true;
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