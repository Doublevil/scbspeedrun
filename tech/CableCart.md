[Go back to the home page](https://github.com/Doublevil/scbspeedrun)

# Cable cart techs

## Grabbing the exit plug from afar

After getting the cable cart, using the cable cart to grab the exit plug from afar can save you a fraction of a second on each level, which really adds up. Even when you get the jump cart, it's still faster to switch to the cable cart and grab the exit plug to end the level.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_CableExitPlug.webp)

Once you get the voltage cart, it's usually pretty fast to just voltage dash to the exit. It should still save a little bit of time to use the cable cart on some levels, so you might still want to try that.

## Grab-hopping

A very useful move with the cable is to jump immediately after grabbing. This move is easy to do and will preserve your jumping horizontal speed, while allowing you to move around obstacles in the most reliable way.

It's also by far the fastest way to move vertically with the cable.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_CableGrabHopping.webp)

## High jumps

As you probably already know by now, when hooked, if you press the jump button while holding Up, Cable Boy will jump extra high.

Now, to reach even higher platforms, you can swing and high jump, and then re-grab the same spot from above, and immediately perform a high jump.

It's a bit tricky because you have to press Down and then immediately Up - the key to get it consistently is to take a few frames after re-grabbing to stabilize and make sure you're pressing Up before jumping.

This is used for a few strats. Here's how Assembly > A7 uses this technique:

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_CableHighJump.webp)

## Fast movement with the cable

Depending on the way you hook, you could kill your momentum and have to build it up again by swinging slowly.

When you don't have any better way of moving around than grabbing walls/ceilings/plugs with the cable, you'll want to hook in specific ways so that you keep moving fast all the way through. Here are a few tips:
- If you're grab-hopping, it doesn't matter how you grab, you should always keep your momentum.
- Grabbing from above and swinging is super slow.
- Swinging and jumping right at the point where you reach max speed keeps this max speed momentum for a while - it's the fastest hook movement, even considering the build-up of the swing.
- Even optimized swings are only very slightly faster than grab-hopping, so it really doesn't matter that much.
- You can sometimes get bonus speed from the way the cable bounces when you grab from far away, but it's very inconsistent.

For reference, the strat for AY0 is pure hook optimization and uses pretty much all of the cable speed techs:

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/levels/A/AY0_Strat.webp)

It starts with grab-hopping because swings, although faster, have a more horizontal trajectory and would definitely crash us into the glitch blocks. But you can see near the end that we use optimized swing jumps when possible.

## Cable clipping

The Cable Cart also allows us to clip through geometry when there are moving objects that we can get to overlap with the end of the cable.

So far, the only useful cable clipping strat we've found is the one that skips the Disassembler fight.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_DisassemblerSkip.webp)

Here, the hand of The Disassembler moves over the cable while we are hooked, which makes the physics engine react in an interesting way, moving Cable Boy around at very high speeds, which means we get to zip through the wall.

We can do similar cable clips with the moving platforms in the AY levels, or with the pistons in the AX levels.

## Wall plug

A wall plug is a technique that consists in grabbing the goal plug through a solid wall. It works by exploiting the pulling effect that goal plugs have on the cable. Because of the pulling effect, when you use the cable cart to grab a wall close enough to a goal plug, and then switch to another cartridge, the cable goes through the wall and ends up on the other side. In this state, it can still plug into the goal.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_WallPlug.webp)

Note that if the goal plug is one block further away, repeatedly and rapidly grabbing and changing carts should eventually extend the cable far enough that it grabs the goal anyways.

Now, this technique looks game-breaking, but in practice, so far, we haven't been able to find significant time saves that use it.

Also note that there are other ways to get the cable to zip through walls (by exploiting the level geometry, trapping the cable in a piston, etc). These should work in the same way in theory, and do not require the goal plug's pull effect.

Interestingly, some wall plugs actually require null cartridge, because it has the unique (and unintended) property of keeping the cable length instead of shrinking it back to normal. This makes is so that switching from cable cart to null cart allows you to grab the goal from further behind a wall.

## Quirks

The cable can sometimes act weird. It might sometimes grab from above its normal max range, or just fail to grab the exit plug when it's clearly in range. These things probably happen because of how the physics engine works, and we can't really predict or manipulate them. But they're rare enough that it doesn't really change our strats at all. Just know that you might have to recover from a failing hook sometimes.
