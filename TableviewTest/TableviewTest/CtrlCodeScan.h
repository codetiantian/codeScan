//
//  CtrlCodeScan.h
//  WisdomSchoolBadge
//
//  Created by zhangyilong on 15/7/16.
//  Copyright (c) 2015年 zhangyilong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol CtrlCodeScanDelegate <NSObject>

@optional
- (void)didCodeScanOk:(id)info;

- (void)getCurrentImage:(UIImage *)image;

@end

@interface CtrlCodeScan : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

@property(nonatomic, weak) IBOutlet UIView*     overlayer;

@property(nonatomic, weak) id<CtrlCodeScanDelegate>      delegate;

//硬件设备
@property(strong, nonatomic) AVCaptureDevice*            device;

//输入流
@property(strong, nonatomic) AVCaptureDeviceInput*       input;

//用于二维码识别以及人脸识别
@property(strong, nonatomic) AVCaptureMetadataOutput*    output;

//协调输入输出流的数据
@property(strong, nonatomic) AVCaptureSession*           session;

//预览层
@property(strong, nonatomic) AVCaptureVideoPreviewLayer* preview;

//用于捕捉静态图片
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;

//原始视频帧，用于获取实时图像以及视频录制
@property (nonatomic, strong) AVCaptureVideoDataOutput *videoDataOutput;

@property(nonatomic, strong) UIView*                     scanFrame;
@property(nonatomic, strong) UIView*                     line;
@property(nonatomic, assign) BOOL                        isLightOn;

- (IBAction)OnTopBackDown:(UIButton*)sender;

@end
