//
//  GameOverScene.m
//  Assign2-2011850711
//
//  Created by Max Kan on 11/11/12.
//
//

#import "GameOverScene.h"
#import "GamePlayLayer.h"

@implementation GameOverScene
@synthesize layer = _layer;

- (id)init {
    
    if ((self = [super init])) {
        self.layer = [GameOverLayer node];
        [self addChild:_layer];
    }
    return self;
}

- (void)dealloc {
    [_layer release];
    _layer = nil;
    [super dealloc];
}

@end

@implementation GameOverLayer
@synthesize label = _label;

-(id) init
{
    if( (self=[super initWithColor:ccc4(255,255,255,255)] )) {
        
        // ask director for the window size
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        // Add background image
        CCSprite *background = [CCSprite spriteWithFile:@"bg_main.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:0];
        
        self.label = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:32];
        _label.color = ccc3(0,0,0);
        _label.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:_label];
        
        // 'Try Again' button
        CCMenuItem *starMenuItem = [CCMenuItemImage
                                    itemWithNormalImage:@"button_tryagain.png" selectedImage:@"button_tryagain.png"
                                    target:self selector:@selector(gameOverDone)];
        starMenuItem.position = ccp(winSize.width/2, winSize.height/2 - _label.scaleY - 60);
        CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
        
    }
    return self;
}

- (void)gameOverDone {
    
    [[CCDirector sharedDirector] replaceScene:[GamePlayLayer scene]];
    
}

- (void)dealloc {
    [_label release];
    _label = nil;
    [super dealloc];
}

@end
