[Go back to the home page](https://github.com/Doublevil/scbspeedrun)

# Cloud techs

This page is about the bouncy clouds that are found in The Cloud and Hacked Cloud.

## Clouds and speedrunning

Clouds are generally slow because they force us to wait for the duration of the bounce. In the speedruns, we like to skip as many clouds as we can using various strats.

Another important thing is that cloud bounce manipulations are very precise and can be downright inconsistent. You should consider strats based on cloud bounce manipulation very risky, and some of them are really not worth the risk.

We don't like clouds very much.

## Cloud physics

Landing on a cloud makes it sink under Cable Boy's weight and then spring back, pushing you up. The physics of the cloud pushing you is actually what makes you jump. The weight and spring physics being at least partially physics-based mean that the behavior of the cloud can be hard to predict.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Cloud_WeirdHeightVariation.webp)

The animation above shows how the physics-based system means that your jump height is hard to predict. The jump looks the same all 3 times, but on the third time only, we don't get enough height to connect with the other cloud.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Cloud_EdgeBounce.webp)

The animation above is another example of how unreliable clouds are.

Now, because jumping is disabled while we are standing on a cloud, we often have no choice but to rely on these unpredictable jumps. There are several things, intended or not, that we can do to manipulate how the clouds make us jump.

### Moving away early

The most obvious (and intended) thing we can do is to move away from the cloud while it's springing. Depending on your timing, you can get various jump heights or avoid jumping entirely.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Cloud_BounceHeight.webp)

This can be very useful to skip some clouds or generally go faster by getting a more horizontal trajectory, but the timing is pretty hard to get right.

### Getting a full bounce with horizontal momentum

Sometimes, however, you want both a very high jump AND some horizontal speed. This can be tricky to get, because of how movement works in the game.

If you've read the in-depth movement page, you know that, while walking speed is constant, air speed takes time to build up, and that the walking speed can be instantly converted to air speed if you jump while moving. Obviously, in this case, we want to do that. So we need the jump to happen while we are moving.

However, if we are moving on the cloud, we risk falling off before the jump and getting a half-bounce (or no bounce at all). In our case, we still want a full-height jump, so that's not good.

One particular technique to make it way easier is to move back and forth on the cloud after landing. Here is what it looks like in slow-motion.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Cloud_BackAndForth.webp)

Because we never stop moving, we are sure to get our walking speed converted to air speed. And because we moved back, we are much less likely to "fall off" the cloud and get a half-jump. This technique makes some strats way more consistent.

## Wall jumps

Another important thing to note about clouds is that the edges work just like normal walls. You can wall jump off of the sides of clouds, just like this:

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Cloud_WallJump.webp)

This sometimes allows us to reach a distant cloud in a single jump instead of having to jump twice, or could be used to skip a bounce entirely. But because wall jumps are themselves not very fast, make sure you're actually saving time when using this technique.

## Interactions with cartridges

This section details interesting cloud behavior when interacting with them using cartridges. In Any%, it's completely useless because we never see a cloud again after we get any cartridge. But maybe these can be used in some way or another someday.

### Reverse bounce

The same spring mechanism that makes the cloud push you up can be used in reverse by dashing against a cloud from below.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Cloud_ReverseBounce.webp)

Sometimes, this will also regenerate your jumps and dash, but this is wildly inconsistent.

### Bounce stop

If you use a dash or voltage downwards right after the cloud makes you jump, you can stand on the cloud without bouncing.

![gif](https://github.com/Doublevil/scbspeedrun/blob/main/media/tech/Cloud_DashStop.webp)

Note that you still cannot jump while standing on the cloud. You can however dash away or use the voltage cart.

This might be useful when you really don't want to bounce, or to stabilize before one of the harder bounces in Hacked Cloud.
