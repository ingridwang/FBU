//
//  PlayViewController.m
//  game
//
//  Created by Rebecca Chen on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "PlayViewController.h"



@interface PlayViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) CGFloat numberSecondsLeft;


@end


@implementation PlayViewController

//initWithLevel to find out how many seconds to start the timer on

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    int level=1;
    int points=0;
    
    // Do any additional setup after loading the view.
    
    self.levelLabel.text=[NSString stringWithFormat:@"Level: %d", level];
    self.scoreLabel.text=[NSString stringWithFormat:@"Points: %d", points];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0
                                                  target:self
                                                selector:@selector(timerFired:)
                                                userInfo:nil
                                                 repeats:YES];

    
    
    
    if(level==1){
        [self setNumberSecondsLeft:10.0];
    }
    else if(level==2){
        [self setNumberSecondsLeft:8.0];
    
    }
    
    else if(level==3){
        [self setNumberSecondsLeft:7.0];
    }
        level++;
    
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
        self.timerLabel.text = [NSString stringWithFormat:@"%.1f", self.numberSecondsLeft];
    }
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //fix the "playview controller show segue from main window and redo pause button"
    self.navigationController.navigationBarHidden=YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
