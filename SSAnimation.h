//
//  SSAnimation.h
//  TRI
//
//  Created by Salman Suhail on 6/27/12.
//  Copyright 2012 PerpetuallyBeta. All rights reserved.
//

#import "cocos2d.h"
#import "CCNode.h"

@interface SSAnimation : CCNode {
    
}

+ (void) pulse: (CCNode *) node;
+ (void) pulse: (CCNode *) node withAmount: (float) amount;

+ (void) pulseForever: (CCNode *) node;

+ (void) animatePowerUps: (CCNode *) node;

+ (void) notify: (CCSprite *) sprite;

+ (void) shake: (CCNode *) node withAmplitude: (int) distance;
+ (void) endGameAnimation: (CCNode *) node;

+ (void) animateFromRight: (CCNode *) sprite ToPosition : (CGPoint) pos;
+ (void) animateFromRight: (CCNode *) sprite ToPosition : (CGPoint) pos afterTime : (float) time ;

+ (void) animateMenuFromLeft: (CCMenu *) menu;
+ (void) animateMenuFromLeftAndAlignLeft: (CCMenu *) menu;
+ (void) animateMenuFromLeftAndAlignLeft: (CCMenu *) menu ToPosition : (CGPoint) pos;

+ (void) drawSelectedMenuItem: (CCMenu *) menu withColor : (ccColor3B) color andSelectedColor :(ccColor3B) selectedColor;

@end
