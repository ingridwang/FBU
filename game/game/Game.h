//
//  Game.h
//  game
//
//  Created by Rebecca Chen on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import <Foundation/Foundation.h>

@interface Game : NSObject
@property(nonatomic)BOOL timerOn;
@property(nonatomic)BOOL speedUp;

@property(nonatomic) Photo* photo;
//@property(nonatomic)int currentLevel;

-(instancetype)initWithPhoto: (Photo*)photo;

//-(void)setSpeed:(BOOL)speed;
//-(void)setTimer:(BOOL)timer;

@end
