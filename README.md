SSAnimation
===========

Collection of commonly used sprite and menu animation methods to be used with Cocos2d. 

**Background**

While working on my first iOS game PYXL ( Check it out here: http://t.co/Iqu1Tm65N9 ) I began to generalize a few of the 
animation methods that I was repeatedly using.  I figured that things like pulsing sprites or menu animations would 
be something useful to the entire Cocos2d community - and therefor would be totally worth sharing. You can see all 
of the methods in action in my game, or you can download the class files and try it out for yourself.

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

