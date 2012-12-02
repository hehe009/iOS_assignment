//
//  WelcomeScene.h
//  Assign2-2011850711
//
//  Created by Max Kan on 2/12/12.
//
//

#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// WelcomeLayer
@interface WelcomeLayer : CCLayerColor
{
}

// returns a CCScene that contains the WelcomeLayer as the only child
+(CCScene *) scene;

@end
