//
//  Game.h
//  game
//
//  Created by Rebecca Chen on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Game : NSObject
@property(nonatomic)BOOL timerOn;
@property(nonatomic)BOOL speedUp;
@property(nonatomic, weak) UIImage *image;
@property(nonatomic)int currentLevel;


-(instancetype)initWithLevel:(int)level;
@end
