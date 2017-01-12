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
    // Ensure a square aspect ratio for our context
    CGFloat contextWidth = fmin(self.size.width, self.size.height);
    CGFloat contextHeight = fmin(self.size.width, self.size.height);
    CGFloat contextCentreX = contextWidth / 2.0;
    CGFloat contextCentreY = contextHeight / 2.0;
    CGFloat border = 0.0;
    CGFloat arcRadius = (contextWidth / 2.0) - border;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(contextWidth, contextHeight), NO, self.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextAddArc(context, contextCentreX, contextCentreY, arcRadius, 0, 2*M_PI, 0);
    CGContextClosePath(context);
    CGContextClip(context);
    
    // Draw centre of image into graphics context
    CGRect rect = CGRectMake((contextWidth - self.size.width) / 2.0, (contextHeight - self.size.height) / 2.0, self.size.width, self.size.height);
    [self drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
