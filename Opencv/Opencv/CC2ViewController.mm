//
//  CC2ViewController.m
//  Opencv
//
//  Created by KingyoWang on 17/2/21.
//  Copyright © 2017年 hp. All rights reserved.
//

#import "CC2ViewController.h"
#import <opencv2/opencv.hpp>
#import <opencv2/imgproc/types_c.h>
#import <opencv2/highgui/ios.h>

@interface CC2ViewController (){
    cv::Mat _cvImage;
    UIImage *_image;
    UIImageView *_imageView;
}

@end

@implementation CC2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_imageView];
    _image = [UIImage imageNamed:@"mountain.jpg"];
    _imageView.image = _image;
    
    }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    static int i = 0;
    i++;
    if (i %2 == 0) {
        _imageView.image = _image;
        
        return;
    }
    
    // convert image to cv::Mat
    UIImageToMat(_image, _cvImage);
    
    if (!_cvImage.empty()) {
        cv::Mat gray;
        
        // convert the image to grayScale
        cv::cvtColor(_cvImage, gray, CV_RGBA2GRAY);
        
        // apply Gaussian filter to remove samll edges
        cv::GaussianBlur(gray, gray, cv::Size(5, 5), 1.2, 1.2);
        
        // Calculate edges with Canny
        cv::Mat edges;
        cv::Canny(gray, edges, 0, 60);
        
        // fill image with white color
        _cvImage.setTo(cv::Scalar::all(255));
        
        // change color on edges
        _cvImage.setTo(cv::Scalar(0, 0, 0, 0), edges);
        
        // convert cv::Mat to UIImage and show the resulting image
        _imageView.image = MatToUIImage(_cvImage);
    }
}

@end
