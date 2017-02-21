//
//  MainViewController.m
//  Opencv
//
//  Created by KingyoWang on 17/2/21.
//  Copyright © 2017年 hp. All rights reserved.
//

#import "MainViewController.h"
#import "CC1ViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)RGB2GRAY:(id)sender {
    CC1ViewController *vc = [[CC1ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
