//
//  Utils.h
//  testNCacheManager
//
//  Created by Napat Yimjan on 11/14/2559 BE.
//  Copyright © 2559 Napat Yimjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface NUtils : NSObject

+(NSData *)getImageDataFromAsset:(PHAsset *)asset;
+(NSMutableArray *)getImageDataFromAssets:(NSMutableArray *)assets;

@end
