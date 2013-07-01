//
//  SSAnimation.m
//  TRI
//
//  Created by Salman Suhail on 6/27/12.
//  Copyright 2012 PerpetuallyBeta. All rights reserved.
//

#import "SSAnimation.h"

@implementation SSAnimation


/// Default Pulse Animation
+ (void) pulse: (CCNode *) node {

    id grow = [CCScaleTo actionWithDuration:.5f scale:1.2f];
    id shrink = [CCScaleTo actionWithDuration:.5f scale:1.0f];      
    id sequence = [CCSequence actions: grow, shrink, nil];
    id easeSequence = [CCEaseInOut actionWithAction:sequence rate:3];
    
    [node runAction:easeSequence];
}

/// Pulse Animation with Options
+ (void) pulse: (CCNode *) node withAmount: (float) amount {
    
    id grow = [CCScaleTo actionWithDuration:.25f scale:amount];
    id shrink = [CCScaleTo actionWithDuration:.25f scale:1.0f];      
    id seq = [CCSequence actions: grow, shrink, nil];
    id ease = [CCEaseOut actionWithAction:seq rate:8];
    
    [node runAction:ease];
}

/// Pulse Forever
+ (void) pulseForever: (CCNode *) node {
    id grow = [CCScaleTo actionWithDuration:.5f scale:1.2f];
    id shrink = [CCScaleTo actionWithDuration:.5f scale:1.0f];
    id sequence = [CCSequence actions: grow, shrink, nil];
    id easeSequence = [CCEaseInOut actionWithAction:sequence rate:3];
    
    id repeat = [CCRepeatForever actionWithAction:easeSequence];
    [node runAction:repeat];
}


+ (void) animatePowerUps: (CCSprite *) node {

    node.scale = 0;
    
    id a = [CCScaleTo actionWithDuration:0.2f scale:1.4];
    id b = [CCScaleTo actionWithDuration:0.1f scale:1.0];
    id wait = [CCMoveBy actionWithDuration:1.0f position:ccp(0, 0)];
    id c = [CCScaleTo actionWithDuration:0.1f scale:1.4];
    id d = [CCScaleTo actionWithDuration:0.1f scale:0];
    id seq = [CCSequence actions:a, b, wait, c, d, nil];
    
    [node runAction:seq];

    id rotate = [CCRotateBy actionWithDuration:0.8 angle:360];
    [node runAction:rotate];
    
}


/// Pulse Notification in the Center of the Screen
+ (void) notify: (CCSprite *) sprite {
    CGSize winSize = [[CCDirector sharedDirector] winSize];                
    sprite.position = ccp(winSize.width / 2, winSize.height / 3 * 2);
    sprite.scale = 0;
    sprite.anchorPoint = ccp( 0.5f, 0 );
    
    id a = [CCScaleTo actionWithDuration:0.2f scale:1.4];
    id b = [CCScaleTo actionWithDuration:0.1f scale:1.0];
    id wait = [CCMoveBy actionWithDuration:1.0f position:ccp(0, 0)];
    id c = [CCScaleTo actionWithDuration:0.1f scale:1.4];
    id d = [CCScaleTo actionWithDuration:0.1f scale:0];
    id seq = [CCSequence actions:a, b, wait, c, d, nil]; 
    
    [sprite runAction:seq];    
}

/// Animate Sprite from the Right
+ (void) animateFromRight: (CCSprite *) sprite ToPosition : (CGPoint) pos {
    [self animateFromRight:sprite ToPosition:pos afterTime:0];
}

+ (void) animateFromRight: (CCNode *) sprite ToPosition : (CGPoint) pos afterTime : (float) time {

    CGSize winSize = [[CCDirector sharedDirector] winSize];                
    float offset = sprite.boundingBox.size.width;
    
    // Set the starting point at the same height but off the screen
    CGPoint startPos = ccp( winSize.width + offset, pos.y );
    
    // Position the menu item at the starting point
    sprite.position = startPos;
    
    // Set the end point as the final position that you want it to be at
    CGPoint endPos = ccp( pos.x, pos.y );
    CGPoint midPos = ccp( pos.x - 30, pos.y);
    
    id timeDelay = [CCMoveBy actionWithDuration:time position:ccp(0, 0)];
    id a = [CCMoveTo actionWithDuration:0.5f position:midPos];
    id b = [CCMoveTo actionWithDuration:1.0f position:endPos];
    id seq = [CCSequence actions:timeDelay, a, b, nil];
    id ease = [CCEaseInOut actionWithAction:seq rate:3];
    
    [sprite runAction:ease];
       
}

/// Animate Menus from the Left
+ (void) animateMenuFromLeft: (CCMenu *) menu {
    // Note that the default position of the menu is in the center of the screen
    CGSize winSize = [[CCDirector sharedDirector] winSize];        
    CCMenuItem * item;
    // Start each menu item further out so that it comes in later
    float delay = 0;
    // Change this value to adjust the fluidity of the menu
    float fluidityAmount = 0.25;
    
    CCARRAY_FOREACH(menu.children, item) {

        float offset = item.boundingBox.size.width;
        
        // Set the starting point at the same height but off the screen
        CGPoint startPos = ccp( -winSize.width / 2 - offset, item.position.y );
        
        // Position the menu item at the starting point
        item.position = startPos;
        
        // Set the end point as the final position that you want it to be at
        CGPoint endPos = ccp( 0, item.position.y );

        CGPoint midPos = ccp( 30, item.position.y);

        id wait = [CCMoveBy actionWithDuration:delay position:ccp(0, 0)];
        id a = [CCMoveTo actionWithDuration:(0.5f) position:midPos];
        id b = [CCMoveTo actionWithDuration:1.0f position:endPos];
        id seq = [CCSequence actions:wait, a, b, nil];
        id ease = [CCEaseInOut actionWithAction:seq rate:3];
        
        [item runAction:ease];

        delay = delay + fluidityAmount;
    }
}

+ (void) animateMenuFromLeftAndAlignLeft: (CCMenu *) menu {
    [self animateMenuFromLeftAndAlignLeft:menu ToPosition:ccp(15, 180)];
}

+ (void) animateMenuFromLeftAndAlignLeft: (CCMenu *) menu ToPosition : (CGPoint) pos {
    // Note that the default position of the menu is in the center of the screen
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CCMenuItem * item;
    float delay = 0;
    // Change this value to adjust the fluidity of the menu
    float fluidityAmount = 0.1;
    
    menu.position = pos;
    
    CCARRAY_FOREACH(menu.children, item) {
        
        float offset = item.boundingBox.size.width;
        
        // Adjust the anchor point for each of the menu items
        item.anchorPoint = ccp(0, 0.5f);
        
        // Set the starting point at the same height but off the screen
        CGPoint startPos = ccp( -winSize.width - offset, item.position.y );
        
        // Position the menu item at the starting point
        item.position = startPos;
        
        // Set the end point as the final position that you want it to be at
        CGPoint endPos = ccp( 0, item.position.y );
        
        CGPoint midPos = ccp( 30, item.position.y);
        
        id wait = [CCMoveBy actionWithDuration:delay position:ccp(0, 0)];
        id a = [CCMoveTo actionWithDuration:(0.5f + delay) position:midPos];
        id b = [CCMoveTo actionWithDuration:1.0f position:endPos];
        id seq = [CCSequence actions:wait, a, b, nil];
        id ease = [CCEaseInOut actionWithAction:seq rate:3];
        
        [item runAction:ease];
        
        delay = delay + fluidityAmount;
    }
}

/*
+ (void) drawSelectedMenuItem: (CCMenu *) menu withColor : (ccColor3B) color andSelectedColor :(ccColor3B) selectedColor {
 
    NSArray *menuItems = [menu children];
    
    
	for (CCMenuItem *m in menuItems) {
		if (m.isSelected) {
            [m setcolor:selectedColor];
		} else {
			[m setColor:color];
		}
    
}
*/

/// Animate a random looking Shaking animation
+ (void) shake: (CCNode *) node withAmplitude: (int) distance; {
    
    [node runAction:[CCRepeat actionWithAction: 
                     [CCSequence actions:
                      [CCMoveBy actionWithDuration:0.05 position:ccp(-distance, distance)],
                      [CCMoveBy actionWithDuration:0.05 position:ccp(distance, -distance)],
                      
                      [CCMoveBy actionWithDuration:0.05 position:ccp(-distance, 0)],
                      [CCMoveBy actionWithDuration:0.05 position:ccp(distance, 0)],
                      
                      [CCMoveBy actionWithDuration:0.05 position:ccp(distance, -distance)],
                      [CCMoveBy actionWithDuration:0.05 position:ccp(-distance, distance)],
                      
                      [CCMoveBy actionWithDuration:0.05 position:ccp(0, distance)],
                      [CCMoveBy actionWithDuration:0.05 position:ccp(0, -distance)],
                      nil] 
                      times:1]];

}


// Specific per game, this is the animation you would implement at the end of the Game
// TODO improve this animation
+ (void) endGameAnimation: (CCNode *) node {
    
    id a = [CCScaleTo actionWithDuration:0.3 scale:0.8];
    id b = [CCScaleTo actionWithDuration:0.7 scale:3.2];
    id c = [CCScaleTo actionWithDuration:0.1 scale:3.0];
    
    
    
//    id zoom = [CCScaleTo actionWithDuration:1 scale:3];
//    id skew = [CCSkewBy actionWithDuration:1 skewX:0 skewY:10];
    id sequence = [CCSequence actions:a, b, c, nil];
    [node runAction: sequence];
    
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
