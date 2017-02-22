//
//  TransformationViewController.m
//  Opencv
//
//  Created by KingyoWang on 17/2/22.
//  Copyright © 2017年 hp. All rights reserved.
//

#import "TransformationViewController.h"
#import <opencv2/opencv.hpp>
#import <opencv2/imgproc/types_c.h>
#import <opencv2/highgui/ios.h>

@interface TransformationViewController (){
    cv::Mat _cvImage;
    UIImage *_image;
    UIImageView *_imageView;
}

@end

@implementation TransformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _image = [UIImage imageNamed:@"mountain.jpg"];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 50, 824, 668)];
    _imageView.image = _image;
    [self.view addSubview:_imageView];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    i++;
    if (i%2==0) {
        _imageView.image = _image;
        return;
    }

    cv::Mat src;
    UIImageToMat(_image, src);
    if (src.empty()) {
        return ;
    };
    
    
    //  topLeft, topRight, bottomRight, bottomLeft
    cv::Point2f src_vertices[4];
    src_vertices[0] = cv::Point(0, 0);
    src_vertices[1] = cv::Point(1920, 0);
    src_vertices[2] = cv::Point(0, 1200);
    src_vertices[3] = cv::Point(1920, 1200);
    
    cv::Point2f dst_vertices[4];
    dst_vertices[0] = cv::Point(122, 0);
    dst_vertices[1] = cv::Point(814,0);
    dst_vertices[2] = cv::Point(22,540);
    dst_vertices[3] = cv::Point(910,540);
    
    cv::Mat warpMatrix = getPerspectiveTransform(src_vertices, dst_vertices);
    cv::Mat rotated;
    warpPerspective(src, rotated, warpMatrix, rotated.size(), cv::INTER_LINEAR, cv::BORDER_CONSTANT);
    
    _imageView.image = MatToUIImage(rotated);
    
    //    // Display the image
    //    cv::namedWindow( "Original Image");
    //    cv::imshow( "Original Image",src);
    //    cv::namedWindow( "warp perspective");
    //    cv::imshow( "warp perspective",rotated);
    //    imwrite( "result.jpg",src);
    //    cv::waitKey();
}

@end
