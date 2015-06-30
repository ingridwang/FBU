//
//  SettingsViewController.m
//  game
//
//  Created by Rebecca Chen on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property(weak, nonatomic) IBOutlet UISwitch* speedSwitch;
@property(weak, nonatomic)IBOutlet UISwitch* timerSwitch;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    
//}



-(void)setTimer{
    
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
