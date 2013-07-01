SSAnimation
===========

Collection of commonly used sprite and menu animation methods to be used with Cocos2d.

**Methods that are included in this class are:**

* Pulse (Rapid expansion and contraction of a sprite once)
* Pulse with Amount (allows variation on default Pulse effect)
* Pulse Forever (continuously neverending Pulse)
* Animate Powerups
* Notify (Sprite Notifications appear in the center of the screen)
* Shake
* Animate from Right (Animates a sprite from the right side of the screen)
* Animate Meny from Left (Animates a menu from the Left side of the screen)


**Usage:**
* Add SSAnimation.m and SSAnimation.h to your XCode project
* #include SSAnimation.h
* Code Example:  
		CCSprite * player = [CCSprite spriteWithFile:@"player.png"];
       	[SSAnimation pulse: player]

