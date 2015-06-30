//
//  ViewController.h
//  game
//
//  Created by Rebecca Chen on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *mover;

@property (strong, nonatomic) IBOutlet UIView *windowView;
@property ( nonatomic) int desiredx;
@property ( nonatomic) int desiredy;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap;

@end

