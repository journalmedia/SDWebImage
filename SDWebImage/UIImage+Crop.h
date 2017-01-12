//
//  UIImage+Crop.h
//  SDWebImage
//
//  Created by Shayan Yousefizadeh on 19/07/2016.
//  Copyright © 2016 Dailymotion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Crop)

/**
 * Returns a square image with a circular mask applied to it.
 * Mask is applied from centre of image.
 */
- (UIImage *)circularlyCroppedImage;

@end
