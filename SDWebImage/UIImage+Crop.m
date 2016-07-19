//
//  UIImage+Crop.m
//  SDWebImage
//
//  Created by Shayan Yousefizadeh on 19/07/2016.
//  Copyright © 2016 Dailymotion. All rights reserved.
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)

- (UIImage *)circularlyCroppedImage
{
    CGFloat imageWidth = self.size.width;
    CGFloat imageHeight = self.size.height;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageWidth, imageHeight), NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat imageCentreX = imageWidth / 2.0;
    CGFloat imageCentreY = imageHeight / 2.0;
    CGFloat radius = fmin(imageWidth, imageHeight) / 2.0;
    
    CGContextBeginPath(context);
    CGContextAddArc(context, imageCentreX, imageCentreY, radius, 0, 2*M_PI, 0);
    CGContextClosePath(context);
    CGContextClip(context);
    
    CGRect myRect = CGRectMake(0, 0, imageWidth, imageHeight);
    [self drawInRect:myRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
