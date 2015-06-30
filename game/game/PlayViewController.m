//
//  PlayViewController.m
//  game
//
//  Created by Rebecca Chen on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "PlayViewController.h"



@interface PlayViewController () <UICollisionBehaviorDelegate>
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) CGFloat numberSecondsLeft;

@property (strong, nonatomic) UIView *ballView;
@property (strong, nonatomic) UIView *backgroundView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIPushBehavior *pusher;
@property (nonatomic, strong) UICollisionBehavior *collider;
@property (nonatomic, strong) UIDynamicItemBehavior *ballDynamicProperties;
@property (nonatomic, strong) UIAttachmentBehavior *attacher;
@property (nonatomic) BOOL *tapped;
@end


@implementation PlayViewController

//initWithLevel to find out how many seconds to start the timer on

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.levelNumber=1;
    self.pointTotal=0;
    
    // Do any additional setup after loading the view.
    
    self.levelLabel.text=[NSString stringWithFormat:@"Level: %d", self.levelNumber];
    self.scoreLabel.text=[NSString stringWithFormat:@"Points: %d", self.pointTotal];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0
                                                  target:self
                                                selector:@selector(timerFired:)
                                                userInfo:nil
                                                 repeats:YES];

    
    
    
    if(self.levelNumber==1){
        [self setNumberSecondsLeft:10.0];
    }
    else if(self.levelNumber==2){
        [self setNumberSecondsLeft:8.0];
    
    }
    
    else if(self.levelNumber==3){
        [self setNumberSecondsLeft:7.0];
    }
    
    //remmeber to do something with points
    
    //self setNumberSecondsLeft:self.game.currentLevel
    //if like level 1 10
    //if level like 2 then 8
    //if level 3 then 5
}

- (void)timerFired:(NSTimer *)timer {
    //self.numberSecondsLeft -= 0.10;
    if (self.numberSecondsLeft >= 0.1) {
        self.numberSecondsLeft -= 0.10;
            //self.timerLabel.text = [NSString stringWithFormat:@"%.1f", self.numberSecondsLeft];
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.tapped = NO;
    //fix the "playview controller show segue from main window and redo pause button"
    self.navigationController.navigationBarHidden=YES;
    UIImage *backgroundImage = [UIImage imageNamed: @"images/tj/tj.png"];
    
    
    
    CGRect backFrame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - backgroundImage.size.width/2, [[UIScreen mainScreen] bounds].size.height/2 - backgroundImage.size.height/2, MIN([[UIScreen mainScreen] bounds].size.width, backgroundImage.size.width), MIN([[UIScreen mainScreen] bounds].size.height, backgroundImage.size.height));
    self.backgroundView = [[UIView alloc] initWithFrame:backFrame];
    self.backgroundView.layer.contents =(__bridge id)[UIImage imageNamed:@"images/tj/tj.png"].CGImage;
    [self.view addSubview:self.backgroundView];
    
    UIImage *cutoutImage = [UIImage imageNamed:@"images/tj/tjcutout.png"];
    
    CGRect ballFrame = CGRectMake(0, [[UIScreen mainScreen]bounds].size.height/2 -138,cutoutImage.size.width, cutoutImage.size.height);
    self.ballView = [[UIView alloc] initWithFrame:ballFrame];
    [self.view addSubview:self.ballView];
    
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapGR];
    
        // Better ball and paddle graphics
    self.ballView.layer.shadowOffset = CGSizeMake(5.0, 8.0);
    self.ballView.layer.shadowOpacity = 0.5;
    self.ballView.layer.contents = (__bridge id)[UIImage imageNamed:@"images/tj/tjcutout.png"].CGImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self initBehaviors];
}

- (void)initBehaviors
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
        // Start ball off with a push
    self.pusher = [[UIPushBehavior alloc] initWithItems:@[self.ballView]
                                                   mode:UIPushBehaviorModeInstantaneous];
    self.pusher.pushDirection = CGVectorMake(1, 0);
        //Add speed
    if(self.levelNumber == 1) {
    self.pusher.magnitude = 0.5;
    } else if(self.levelNumber ==2 ) {
        self.pusher.magnitude = 1;
    } else if(self.levelNumber == 3 ) {
        self.pusher.magnitude =1.5;
    } else if(self.levelNumber == 4) {
        self.pusher.magnitude = 2;
    }
    self.pusher.active = YES; // Because push is instantaneous, it will only happen once
    [self.animator addBehavior:self.pusher];
    
        // Step 1: Add collisions
    self.collider = [[UICollisionBehavior alloc] initWithItems:@[self.ballView]];
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    self.collider.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.collider];
    
        // Step 2: Remove rotation
    self.ballDynamicProperties = [[UIDynamicItemBehavior alloc]
                                  initWithItems:@[self.ballView]];
    self.ballDynamicProperties.allowsRotation = NO;
    [self.animator addBehavior:self.ballDynamicProperties];
    
        // Step 4: Better collisions, no friction
    self.ballDynamicProperties.elasticity = 1.0;
    self.ballDynamicProperties.friction = 0.0;
    self.ballDynamicProperties.resistance = 0.0;
    
}

- (void)tapped:(UIGestureRecognizer *)gr
{
    
    if(!self.tapped) {
    CGPoint point = [self.ballView.superview convertPoint:self.ballView.frame.origin toView:self.view];
    NSLog(@"%f", point.x);
    if(abs(point.x - 198) < 10) {
        NSLog(@"YOU WON");
        self.levelNumber++;
        self.pointTotal += 10;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.pointTotal];
        self.levelLabel.text = [NSString stringWithFormat:@"Level: %d", self.levelNumber];
            //[self.timer invalidate];
    }
    self.animator = nil;
        self.tapped = YES;
    }
    else{
            //self.timer=nil;
            //self.timer=[NSTimer timerWithTimeInterval:1.0/10.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
        
        
        self.tapped = NO;
    UIImage *cutoutImage = [UIImage imageNamed:@"images/tj/tjcutout.png"];
    self.ballView.frame = CGRectMake(0, [[UIScreen mainScreen]bounds].size.height/2 -138,cutoutImage.size.width, cutoutImage.size.height);
    
    
    [self initBehaviors];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    
//
    
//    self.animator = nil;
//    self.collider = nil;
//    self.pusher = nil;
}

- (void)reset
{
    [self.animator removeAllBehaviors];
    self.collider = nil;
    self.pusher = nil;
    self.ballDynamicProperties = nil;
    self.attacher = nil;
    
    self.ballView.frame = CGRectMake(100.0, 100.0, 64.0, 64.0);
    
    [self initBehaviors];
}


- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
