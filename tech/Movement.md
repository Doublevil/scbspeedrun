[Go back to the home page](https://github.com/Doublevil/scbspeedrun)

# In-depth movement

This page details how general movement and jumping work in the game.

## Acceleration and jump speed

When grounded, Cable Boy walks at a constant speed.

When in the air, however, holding right or left accelerates him until he reaches full speed.

When jumping while already walking, the walking speed still applies, which means pressing Right and then Jump is faster than pressing Jump and then Right.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_AerialAcceleration.webp)

Moreover, the maximum horizontal speed when in the air is higher than the constant walking speed.

This effectively means that, on a flat terrain, jumping repeatedly is faster than just walking.

For example, in Core > KernelPanic, reaching the cutscene takes 00:11.203 when walking, but only 00:10:540 when introducing a bunch of jumps.

## Jumping physics

In most platformers, you can hold the jump button to jump higher. In Super Cable Boy, even a single-frame tap will produce a full-height jump. This is not ideal for speedrunning, as we often want to reduce the time we spend in the air in order to be able to get another jump from the ground.

However, pressing down will almost immediately cancel all upward momentum and have you start falling earlier. In previous updates, you had to let go of any other direction while pressing down to cancel jumps, which put D-Pad users to even more of a disadvantage, but this has been fixed. Certain strats made prior to this update might still reflect that.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_JumpCancel.webp)

## Coyote time

Coyote time refers to the delay, after falling from an edge, where the game will still let you jump as if you were on the ground.

In Super Cable Boy, that delay is pretty generous, which makes it very useful, especially since gravity is so slow to kick-in. We can use it for certain strats, for instance to skip clouds in The Cloud > C0.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_CoyoteTimeCloudSkip.webp)

It should be noted that it is also granted when wall-clipping using the ink cart, because the game considers you are standing on a platform for as long as you are inside the wall. This allows us to get an additional jump in the air when a clip is possible.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_WallClipCoyoteTime.webp)

## Wall jumps

Wall jumps are another way of moving around. Wall jumps are shorter in height but provide a noticeable boost in horizontal speed, compared to ground jumps.

Once you get the Cable Cart, you'll want to minimize vertical wall jumps, as they're pretty slow overall. They will be even more of a loss when you get the jump and voltage carts.

## Corner boost

Corner boosting is a pretty inconsistent technique that you can theoretically execute every time you're jumping, dashing or generally moving fast against a corner of a platform from below.

What it does is a couple things:
- You can jump right after making it to the corner, cutting down the time you'd otherwise wait for Cable Boy to fall down and land on the platform.
- Your Jump Cart is regenerated, meaning you can dash right away, even if you executed the corner boost with a dash.
- It will actually shoot you past the corner, which can make you move very fast, especially if you are executing the corner boost with a dash.

Here's an example in The Tower > T, demonstrating how you can jump right after making it past the corner on a corner boost. When corner boosting with a simple jump, the boost is very subtle, but you can kind of see it here pushing Cable Boy upwards.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_CornerBoostJump.webp)

Corner boosting is used for various strats, but you should always plan a backup for when it fails, because it's so inconsistent.

Dashing gives the best results in terms of speed. Here's an example with a dash, where you can see both the speed boost and the jump cart regen:

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_CornerBoostDash.webp)

## Movement speed with cartridges

Jumping while swinging with the **Cable Cart** keeps the momentum of the swing, meaning you can reach slightly higher speed than the game would usually allow you to. However, when hooking, you have to be careful about your angle and distance from the point you are hooking to. Depending on these factors, it might stop you for a little while, or build up on your momentum. Getting the latter is not entirely consistent, but seems to work better when you're close to the hook point.

With the **Jump Cart**, the dash is one of the fastest movement in the game. However, it's a short burst that has to be refreshed by touching the ground or a wall. So to maximize the speed we can get from it, we chain it with short jumps, in what we call **Jump dashing**, like this:

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_JumpDash.webp)

Now, doing the same with the **Voltage Cart** is even faster, mostly because you don't have to refresh it so often. This is **Voltage dashing**:

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_VoltageDash.webp)

## Glitch cancel

When a vertical wall intersects with a glitch block (with a 90Åã angle), you can actually stand on the glitch block without dying. This is known as **Glitch cancel**.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Movement_GlitchCancel.webp)

It will only work if you have very little speed when touching the glitch block. The easiest way to trigger it is to dash or voltage against the wall right above the block, so that you fall on the block very slowly.

Trying to move while standing on the glitch will trigger a collision and you will die. However, you can jump, dash away, or voltage away. Sometimes, switching to the voltage cart will also trigger a collision (it's very unstable).

There are places where it will consistently work, other places where it's harder to get, and some places where it doesn't really work. We don't know why.

Due to the particular wall configuration required to trigger glitch cancel, it isn't actually useful for speedrunning (if there is a wall, that means you can already wall jump anyways).
