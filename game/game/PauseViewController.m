//
//  PauseViewController.m
//  game
//
//  Created by Rebecca Chen on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "PauseViewController.h"

@interface PauseViewController ()
@property (nonatomic,copy) void (^resumeBlock)(void);
@end

@implementation PauseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)resume:(UIButton *)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)presentPauseViewController {
	PauseViewController *pvc = [[PauseViewController alloc] init];
	
	pvc.resumeBlock = ^{
			};
}

-(void)resumeBlock:(id)sender {
	if (self.resumeBlock) {
		self.resumeBlock();
	}
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
