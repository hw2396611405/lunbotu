//
//  ViewController.m
//  lunbotu
//
//  Created by wanghui on 16/4/4.
//  Copyright © 2016年 wanghui. All rights reserved.
//

#import "ViewController.h"
#import "PhotoView.h"


@interface ViewController ()
@property (nonatomic,strong)PhotoView *photoView;
//@property(nonatomic,weak)PhotoView *photoView1;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*这里除了Main函数采用可视化外，其余的将采用纯代码的方式
     在实际应用中我们会很多时候使用到轮播图
     
     文件少，代码简洁
     不依赖任何其他第三方库，耦合度低
     同时支持本地图片及网络图片
     可修改分页控件位置，显示或隐藏
     自定义分页控件的图片，就是这么个性
     自带图片缓存，一次加载，永久使用
     性能好，占用内存少，轮播流畅
     
     */
    
    
    
    
    //本地图片
    NSArray *arr1 = @[[UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"2.jpg"], [UIImage imageNamed:@"3.jpg"], [UIImage imageNamed:@"4.jpg"], [UIImage imageNamed:@"5.jpg"]];
    //    //网络图片
    //    NSArray *arr2 = @[@"http://www.5068.com/u/faceimg/20140725173411.jpg", @"http://file27.mafengwo.net/M00/52/F2/wKgB6lO_PTyAKKPBACID2dURuk410.jpeg", @"http://file27.mafengwo.net/M00/B2/12/wKgB6lO0ahWAMhL8AAV1yBFJDJw20.jpeg"];
    //    //既有本地图片也有网络图片
    //    NSArray *arr3 = @[@"http://www.5068.com/u/faceimg/20140725173411.jpg", [UIImage imageNamed:@"2.jpg"], @"http://file27.mafengwo.net/M00/52/F2/wKgB6lO_PTyAKKPBACID2dURuk410.jpeg", [UIImage imageNamed:@"1.jpg"]];
    //
    
    //创建方式1
    //    self.carouselView = [[XRCarouselView alloc] initWithFrame:CGRectMake(0, 100, 375, 180)];
    //    self.carouselView.imageArray = arr3;
    
    //创建方式2
    //    self.carouselView = [[XRCarouselView alloc] initWithImageArray:arr1];
    //    self.carouselView.frame = CGRectMake(0, 100, 375, 180);
    
    //创建方式3
    //    self.carouselView = [[XRCarouselView alloc] initWithImageArray:arr2 imageClickBlock:^(NSInteger index) {
    //        NSLog(@"第%ld张图片被点击", index);
    //    }];
    //    self.carouselView.frame = CGRectMake(0, 100, 375, 180);
    //
    //创建方式4
    //    self.carouselView = [XRCarouselView carouselViewWithImageArray:arr3];
    //    self.carouselView.frame = CGRectMake(0, 100, 375, 180);
    
    
    
    
    
    NSArray *describeArray = @[@"这是第一张图片的描述", @"这是第二张图片的描述", @"这是第三张图片的描述", @"这是第四张图片的描述",@"这是第五张图片的描述"];
    //创建方式5
    
    
    self.photoView  = [PhotoView photoViewImageArray:arr1 describeArray:describeArray];
    self.photoView.imageIndexBlock = ^(NSInteger index) {
        NSLog(@"第%ld张图片被点击", index);
    };
    
    self.photoView.frame = CGRectMake(0, 100, 375, 180);
    //设置每张图片的停留时间
    _photoView.time = 1.5;
    //设置分页控件的图片
    [_photoView setPageImage:[UIImage imageNamed:@"other"] andCurrentImage:[UIImage imageNamed:@"current"]];
    //设置分页控件的frame
    CGFloat width = arr1.count * 30;
    CGFloat height = 20;
    CGFloat x = _photoView.frame.size.width - width - 10;
    CGFloat y = _photoView.frame.size.height - height - 20;
    _photoView.pageControl.frame = CGRectMake(x, y, width, height);
    //隐藏分页控件
    //    _carouselView.pageControl.hidden = YES;
    [self.view addSubview:_photoView];
    
    
    
    //    _photoView1.imageArray = arr1;
    //    _photoView1.describeLabel.center = CGPointMake(375 / 2, 10);
    //    _photoView1.time = 2;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)start:(id)sender {
    [_photoView startTimer];
}

- (void)stop:(id)sender {
    [_photoView  stopTimer];
}


@end
