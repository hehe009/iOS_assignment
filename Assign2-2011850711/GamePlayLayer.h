//
//  GamePlayLayer.h
//  Assign2-2011850711
//
//  Created by Max Kan on 11/11/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// GamePlayLayer
@interface GamePlayLayer : CCLayerColor
{
    CCLabelTTF *_timeLabel;
}
@property (nonatomic, assign) CCLabelTTF *timeLabel;

// returns a CCScene that contains the GamePlayLayer as the only child
+(CCScene *) scene;

@end
