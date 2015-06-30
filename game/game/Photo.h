//
//  Photo.h
//  game
//
//  Created by Rebecca Chen on 6/30/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Photo : NSObject
@property(strong, nonatomic)UIImage* backgroundImage;
@property(strong, nonatomic)UIImage* cutoutImage;

@property(nonatomic)CGPoint pointFromOriginal;


@end
