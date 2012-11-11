//
//  Alien.h
//  Assign2-2011850711
//
//  Created by Max Kan on 11/11/12.
//
//

#import "cocos2d.h"
#import "HelloWorldLayer.h"

@interface Alien: CCNode <CCTargetedTouchDelegate> {
    CCSprite *mySprite;
    HelloWorldLayer *myLayer;
    int _minMoveDuration;
    int _maxMoveDuration;
}
@property (nonatomic, retain) CCSprite *mySprite;
@property (nonatomic, retain) HelloWorldLayer *myLayer;
@property (nonatomic, assign) int minMoveDuration;
@property (nonatomic, assign) int maxMoveDuration;

-(id)initWithLayer:(HelloWorldLayer *)layer;
@end