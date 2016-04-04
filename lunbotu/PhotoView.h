//
//  PhotoView.h
//  lunbotu
//
//  Created by wanghui on 16/4/4.
//  Copyright © 2016年 wanghui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^IndexBlock)(NSInteger index);

@interface PhotoView : UIView
#pragma mark 属性
//轮播的图片数组 可以是图片 也可以是网络请求下来 在这里我们给出的是本地图片
@property(nonatomic,strong)NSArray *imageArray;
//图片描述的数组，这里应该与图片顺序一致
@property(nonatomic,strong)NSArray *describeArray;
//分页控件
@property(nonatomic,strong)UIPageControl *pageControl;
//图片描述控件
@property(nonatomic,strong)UILabel *describeLabel;
//添加定时器  操作每一页停留的时间
@property(nonatomic,assign)NSTimeInterval time;
//点击图片后要执行的操作，会返回图片在数组的索引
@property(nonatomic,copy)IndexBlock imageIndexBlock;

#pragma mark 构造方法
-(instancetype)initWithImageArray:(NSArray *)imageArray;
+(instancetype)photoViewImageArray:(NSArray *)imageArray;
-(instancetype)initWithImageArray:(NSArray *)imageArray describeArray:(NSArray *)describeArray;
+(instancetype)photoViewImageArray:(NSArray *)imageArray describeArray:(NSArray *)describeArray;
-(instancetype)initWithImageArray:(NSArray *)imageArray imageIndexBlock:(IndexBlock)imageIndexBlock;
+(instancetype)photoViewImageArray:(NSArray *)imageArray imageIndexBlock:(IndexBlock)imageIndexBlock;

#pragma mark 方法
//开启定时器 （默认开启 调用该方法会重新开启）
-(void)startTimer;
//停止定时器 （当手点击图片时，定时器关闭 如果手动滑动图片时，定时器会重新开启）
-(void)stopTimer;
//设置分页控件的图片,两个图片都不能为空，否则设置无效，不设置则为系统默认
- (void)setPageImage:(UIImage *)pageImage andCurrentImage:(UIImage *)currentImage;
//清除沙盒中的图片缓存  （此方法只用我们在网络上请求图片时使用）
- (void)clearDiskCache;


@end
