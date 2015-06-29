//
//  ImageStore.h
//  game
//
//  Created by Rebecca Chen on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ImageStore : NSObject

-(void)setImage:(UIImage*)image forKey:(NSString*)key;
-(void)displayImage:(UIImage*)image;

@end
