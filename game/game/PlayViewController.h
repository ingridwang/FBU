//
//  PlayViewController.h
//  game
//
//  Created by Rebecca Chen on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Game;
@interface PlayViewController : UIViewController


@property(strong, nonatomic)Game* game;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property(weak, nonatomic)IBOutlet UILabel* levelLabel;
@property(nonatomic)BOOL timerOn;
@property(nonatomic)BOOL speedUp;

@property(nonatomic)int levelNumber;
@property(nonatomic)int pointTotal;

@end
