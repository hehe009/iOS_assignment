//
//  WelcomeScene.m
//  Assign2-2011850711
//
//  Created by Max Kan on 2/12/12.
//
//

// Import the interfaces
#import "WelcomeScene.h"
#import "GamePlayLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - WelcomeLayer

// WelcomeLayer implementation
@implementation WelcomeLayer
@synthesize label = _label;

// Helper class method that creates a Scene with the WelcomeLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WelcomeLayer *layer = [WelcomeLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)])) {
        
        // ask director for the window size
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        // Add background image
        CCSprite *background = [CCSprite spriteWithFile:@"bg_title.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:0];
        
        
        self.label = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:32];
        _label.color = ccc3(0,0,0);
        _label.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:_label];
        
        // 'Try Again' button
        CCMenuItem *starMenuItem = [CCMenuItemImage
                                    itemWithNormalImage:@"button_start.png" selectedImage:@"button_start.png"
                                    target:self selector:@selector(gameStart)];
        starMenuItem.position = ccp(winSize.width/2, winSize.height/2 - _label.scaleY - 60);
        CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
        
	}
	return self;
}

- (void)gameStart {
    
    [[CCDirector sharedDirector] replaceScene:[GamePlayLayer scene]];
    
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