//
//  UIImage+WSK.h
//  CorePlotDemo
//
//  Created by 何 振东 on 12-9-26.
//  Copyright (c) 2012年 开趣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/ImageIO.h>

@interface UIImage (Addition)

/**
 *  抓取屏幕。
 *  scale:屏幕放大倍数，1为原尺寸。
 *  return  屏幕后的Image。
 */
+ (UIImage *)grabScreenWithScale:(CGFloat)scale;

/**
 *  抓取UIView及其子类。
 *  view: UIView及其子类。
 *  scale:屏幕放大倍数，1为原尺寸。
 *  return  抓取图片后的Image。
 */
+ (UIImage *)grabImageWithView:(UIView *)view scale:(CGFloat)scale;

/**
 *  合并两个Image。
 *   image1、image2: 两张图片。
 *   frame1、frame2:两张图片放置的位置。
 *    size:返回图片的尺寸。
 *  return  合并后的两个图片的Image。
 */
+ (UIImage *)mergeWithImage1:(UIImage *)image1 image2:(UIImage *)image2 frame1:(CGRect)frame1 frame2:(CGRect)frame2 size:(CGSize)size;

/**
 *  把一个Image盖在另一个Image上面。
 *  image: 底图。
 *  mask:盖在上面的图。
 *  return  Image。
 */
+ (UIImage *)maskImage:(UIImage *)image withMask:(UIImage *)mask;

/**
 *  把一个Image尺寸缩放到另一个尺寸。
 *  view: UIView及其子类。
 *  scale:屏幕放大倍数，1为原尺寸。
 *  return  尺寸更改后的Image。
 */
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;

/**
 *  改变一个Image的色彩。
 *  image: 被改变的Image。
 *  color: 要改变的目标色彩。
 *  return  色彩更改后的Image。
 */
+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color;

//按frame裁减图片
+ (UIImage *)captureView:(UIView *)view frame:(CGRect)frame;


- (UIImage *)imageAtRect:(CGRect)rect;
// 按比例压缩， 切割多余部分
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
//按比例压缩到某尺寸 保证原图内容
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

- (UIImage *)thumbnailForAsset:(ALAsset *)asset maxPixelSize:(NSUInteger)size;

/**
 *  获取到原图以后，按size比例重绘image  可以达到缩小原图的效果，减少图片大小
 *  sourceImage 源图
 *  targetSize  想要的图片尺寸大小
 *  @return 重绘的图片
 */
- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize;

@end
