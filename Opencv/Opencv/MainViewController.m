//
//  MainViewController.m
//  Opencv
//
//  Created by KingyoWang on 17/2/21.
//  Copyright © 2017年 hp. All rights reserved.
//

#import "MainViewController.h"
#import "CC1ViewController.h"
#import "CC2ViewController.h"
#import "TransformationViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


// 摄像头彩色转灰度
- (IBAction)RGB2GRAY:(id)sender {
    CC1ViewController *vc = [[CC1ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

// 获取图片轮廓
- (IBAction)getImageEdge:(id)sender {
    CC2ViewController *vc = [[CC2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

// 透视变换
- (IBAction)transformImage:(id)sender {
    TransformationViewController *vc = [[TransformationViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
