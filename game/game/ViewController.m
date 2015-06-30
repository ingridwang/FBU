//
//  ViewController.m
//  game
//
//  Created by Rebecca Chen on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//
 #import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        //[self moveBox ];
}
-(void) viewDidAppear:(BOOL)animated   {
    [super viewDidAppear:animated];
    [self move];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) move {
    CGRect frame2 = CGRectMake(500,  _mover.bounds.origin.y+_mover.frame.size.height+80,_mover.frame.size.width , _mover.frame.size.height);
    [UIView animateKeyframesWithDuration:.7
     
                                   delay:0
                                 options: UIViewKeyframeAnimationOptionRepeat | UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionCalculationModeLinear | UIViewAnimationOptionBeginFromCurrentState
                              animations:^ {
                                  [UIView addKeyframeWithRelativeStartTime:0
                                                          relativeDuration:2
                                                                animations:^{
                                                                    _mover.frame = frame2;
                                  }];
                                  NSLog(@"%f, %f", _mover.frame.origin.x, _mover.frame.origin.y);
                              }
                              completion:nil ];
    
}
-(void) moveBox {
    [_mover setFrame:CGRectMake(0, 0 ,_mover.frame.size.height, _mover.frame.size.width)];
    for (int i =0; i<100; i++) {
         [_mover setFrame:CGRectMake(_mover.frame.origin.x+1, _mover.frame.origin.y+1,_mover.frame.size.height, _mover.frame.size.width)];
     
        NSLog(@"X: %f Y: %f",_mover.frame.origin.x, _mover.frame.origin.y);
    }
}
- (IBAction)tapped:(id)sender {
    NSLog(@"Tapped!");
}
@end



