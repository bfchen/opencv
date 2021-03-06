//
//  CC1ViewController.m
//  Opencv
//
//  Created by KingyoWang on 17/2/21.
//  Copyright © 2017年 hp. All rights reserved.
//

#import "CC1ViewController.h"
#import <opencv2/opencv.hpp>
#import <opencv2/highgui/cap_ios.h>
#import <opencv2/imgproc/types_c.h>
#import <opencv2/highgui/ios.h>

@interface CC1ViewController ()<CvVideoCameraDelegate>{
    cv::Mat _cvImage;
    UIImageView *_cameraView;
    CvVideoCamera *_videoCamera;
    
}
@end

@implementation CC1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cameraView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cameraView];
    
    _videoCamera = [[CvVideoCamera alloc] initWithParentView:_cameraView];
    _videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    _videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset640x480;
    _videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    _videoCamera.defaultFPS = 30;
    _videoCamera.grayscaleMode = NO;
    _videoCamera.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [_videoCamera start];
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_videoCamera stop];
}



#pragma mark - CvVideoCameraDelegate

// 过程猜想：摄像头获取的每一帧图片都调用这个方法转换，然后重新展示

- (void)processImage:(cv::Mat &)image {
    // 在这里我们将要添加图形处理的代码
    static int i = 1;
    NSLog(@"process image %d", i++);
    
    // 将一个图片进行黑白反转
    cv::Mat image_copy;
    // 首先将图片由RGBA转成GRAY
    cv::cvtColor(image, image_copy, cv::COLOR_BGR2GRAY);
    // 反转图片
    cv::bitwise_not(image_copy, image_copy);
    // 将处理后的图片赋值给image，用来显示
    cv::cvtColor(image_copy, image, cv::COLOR_GRAY2BGR);
    
    
    // 或取图片轮廓
//    cv::Mat gray;
//    
//    // convert the image to grayScale
//    cv::cvtColor(image, gray, CV_RGBA2GRAY);
//    
//    // apply Gaussian filter to remove samll edges
//    cv::GaussianBlur(gray, gray, cv::Size(5, 5), 1.2, 1.2);
//    
//    // Calculate edges with Canny
//    cv::Mat edges;
//    cv::Canny(gray, edges, 0, 60);
//    
//    // fill image with white color
//    _cvImage.setTo(cv::Scalar::all(255));
//    
//    // change color on edges
//    _cvImage.setTo(cv::Scalar(0, 100, 100, 100), edges);
//    
//    // convert cv::Mat to UIImage and show the resulting image
//    cv::cvtColor(edges, image, cv::COLOR_GRAY2BGR);
    
}


@end
