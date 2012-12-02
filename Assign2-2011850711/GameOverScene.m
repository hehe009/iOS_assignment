//
//  GameOverScene.m
//  Assign2-2011850711
//
//  Created by Max Kan on 11/11/12.
//
//

// Import the interfaces
#import "GameOverScene.h"
#import "Alien.h"
#import "SimpleAudioEngine.h"

@implementation GameOverLayer
@synthesize label = _label;

// Helper class method that creates a Scene with the GameOverLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameOverLayer *layer = [GameOverLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)])) {
        
        // ask director for the window size
		CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        CCSprite *background = [CCSprite spriteWithFile:@"bg_main.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:0];
        
        self.label = [CCLabelTTF labelWithString:@"You stop those aliens\nThank you!" fontName:@"Arial" fontSize:32];
        _label.color = ccc3(255,255,255);
        _label.position = ccp(winSize.width/2, winSize.height/2 + 80);
        [self addChild:_label];
        
        // 'Try Again' button
        CCMenuItem *starMenuItem = [CCMenuItemImage
                                    itemWithNormalImage:@"button_tryagain.png" selectedImage:@"button_tryagain_pressed.png"
                                    target:self selector:@selector(gameOverDone)];
        starMenuItem.position = ccp(winSize.width/2, winSize.height/2 - _label.scaleY - 60);
        CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
        starMenu.position = CGPointZero;
        
        // preload button SE
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"SE_button.wav"];
        
        [self addChild:starMenu];
        
    }
	return self;
}

// start the game after button "Start" is pressed
- (void)gameOverDone {
    
    // play SE when button press
    [[SimpleAudioEngine sharedEngine] playEffect:@"SE_button.wav"];
    
    // switch to GamePlayLayer
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.5 scene:[GamePlayLayer scene] withColor:ccWHITE]];
    
    // stop background music
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    
    // Start up the background music
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"SE_title_bg.mp3"];
    
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