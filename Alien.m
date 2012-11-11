//
//  Alien.m
//  Assign2-2011850711
//
//  Created by Max Kan on 11/11/12.
//
//

#import "Alien.h"

@implementation Alien
@synthesize mySprite, myLayer;
@synthesize minMoveDuration = _minMoveDuration;
@synthesize maxMoveDuration = _maxMoveDuration;


// remove alien
-(void) finishedmove {
    [self removeFromParentAndCleanup:YES];
}

// remove alien when being touch
-(void) removeMe {
    [self removeFromParentAndCleanup:YES];
}

// init alien
-(id)initWithLayer:(HelloWorldLayer *)layer
{
    self = [super init];
    if (self) {
        self.myLayer=layer;
        [layer addChild:self];
        
        
        self.mySprite=[CCSprite spriteWithFile:@"missile.png"];
        
        // Determine where to spawn the alien along the X axis
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        int minX = mySprite.contentSize.width/2;
        int maxX = winSize.width - mySprite.contentSize.width/2;
        int rangeX = maxX - minX;
        int actualX = (arc4random() % rangeX) + minX;
       
        // spawn alien with the location calculated above
        mySprite.position=ccp(actualX, winSize.height + (mySprite.contentSize.height/2));
        [self addChild:mySprite];
        
        // Determine speed of the alien
        int minDuration = 6;
        int maxDuration = 8;
        int rangeDuration = maxDuration - minDuration;
        int actualDuration = (arc4random() % rangeDuration) + minDuration;
        
        // define move
        id move=[CCMoveTo actionWithDuration:actualDuration position: ccp(actualX, -mySprite.contentSize.height/2)];
        id callback=[CCCallFunc actionWithTarget:self selector:@selector(finishedmove)];
        [mySprite runAction:[CCSequence actions:move, callback, nil]];
        
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

// define touch when alien enter the screen
- (void)onEnter
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}

// remove touch when alien exit the screen
- (void)onExit
{
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    [super onExit];
}

// determine touch
-(BOOL)containsTouch:(UITouch *)touch {
    CGRect r=[mySprite textureRect];
    CGPoint p=[mySprite convertTouchToNodeSpace:touch];
    return CGRectContainsPoint(r, p );
}

// when user touch the screen
-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    if (![self containsTouch:touch]) return NO;
    [self removeMe];
    return YES;
}
@end
