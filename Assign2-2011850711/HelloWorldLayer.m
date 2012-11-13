//
//  HelloWorldLayer.m
//  Assign2-2011850711
//
//  Created by Max Kan on 11/11/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "Alien.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "GameOverScene.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer
@synthesize timeLabel = _timeLabel;

float timer = 0;
float spawninterval = 2.5;
NSString *strtimer = @"time elapsed: ";

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// spawn aliens
-(void) spawnaliens:(ccTime)dt
{
    Alien *alien=[[Alien alloc] initWithLayer:self];
    [alien release];
    if (spawninterval > 0.4) {
        spawninterval -= 0.03;
        [self unschedule:@selector(spawnaliens:)];
        [self schedule:@selector(spawnaliens:) interval:spawninterval];
    }
}

// update timer on screen
-(void)updatetimer:(ccTime)dt
{
    timer += dt;
    int mins = timer/60;
    int secs = timer-(mins*60);
    [_timeLabel setString: [NSString stringWithFormat:@"%@ %d:%02d",strtimer, mins,secs]];

    // Time elapsed over 3 minutes, win the game
    if(timer >= 180) {
        GameOverScene *gameOverScene = [GameOverScene node];
            [gameOverScene.layer.label setString:@"You win."];
            [[CCDirector sharedDirector] replaceScene:gameOverScene];
    }
    
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)])) {
        
        timer = 0;
        
        // Get the dimensions of the window for calculation purposes
		CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        self.timeLabel = [CCLabelTTF labelWithString: [NSString stringWithFormat:@"%@", strtimer] dimensions:CGSizeMake(120, 80) hAlignment:UITextAlignmentRight fontName:@"Marker Felt" fontSize:24];
        _timeLabel.position = ccp(winSize.width - _timeLabel.contentSize.width/2, _timeLabel.contentSize.height/2);
        _timeLabel.color = ccc3(0,0,0);
        [self addChild:_timeLabel z:1];
        
        [self schedule:@selector(spawnaliens:) interval:spawninterval];

        // set timer
        [self schedule:@selector(updatetimer:) interval:1.0];

	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
