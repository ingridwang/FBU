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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0
                                                  target:self
                                                selector:@selector(timerFired:)
                                                userInfo:nil
                                                 repeats:YES];
    [self setNumberSecondsLeft:10.0];
}

- (void)timerFired:(NSTimer *)timer {
    self.numberSecondsLeft -= 0.10;
    self.timerLabel.text = [NSString stringWithFormat:@"%.1f", self.numberSecondsLeft];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
