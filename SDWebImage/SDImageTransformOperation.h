//
//  SDImageTransformOperation.h
//  SDWebImage
//
//  Created by Shayan Yousefizadeh on 08/03/2017.
//  Copyright © 2017 Dailymotion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef UIImage *(^SDImageTransformTransformationBlock)(UIImage *image);
typedef NSString *(^SDImageTransformCacheKeyBlock)(NSString *key);

@interface SDImageTransformOperation : NSObject

@property (nonatomic, copy) SDImageTransformTransformationBlock transformBlock;
@property (nonatomic, copy) SDImageTransformCacheKeyBlock keyBlock;

@end
