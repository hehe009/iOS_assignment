//
//  GameOverScene.h
//  Assign2-2011850711
//
//  Created by Max Kan on 11/11/12.
//
//

#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// GameOverLayer
@interface GameOverLayer : CCLayerColor
{
    CCLabelTTF *_label;
}
@property (nonatomic, assign) CCLabelTTF *label;

// returns a CCScene that contains the GameOverLayer as the only child
+(CCScene *) scene;

@end