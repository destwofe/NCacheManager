//
//  Utils.m
//  testNCacheManager
//
//  Created by Napat Yimjan on 11/14/2559 BE.
//  Copyright © 2559 Napat Yimjan. All rights reserved.
//

#import "NUtils.h"

@implementation NUtils

+(NSData *)getImageDataFromAsset:(PHAsset *)asset{
    __block NSData *image;
    
    PHImageManager *manager = [PHImageManager defaultManager];
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    options.synchronous = YES;
    options.networkAccessAllowed = YES;
    options.progressHandler = ^(double progress, NSError *error, BOOL *stop, NSDictionary *info) {
        NSLog(@"%f", progress);
    };
    
    
    [manager requestImageDataForAsset:asset options:options resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
        image=imageData;
    }];
    
    return image;
}

+(NSMutableArray *)getImageDataFromAssets:(NSMutableArray *)assets{
    //    self.assets = [NSMutableArray arrayWithArray:assets];
    PHImageManager *manager = [PHImageManager defaultManager];
    __block NSMutableArray *images = [[NSMutableArray alloc]init];
    
    for (PHAsset *asset in assets) {
        // Do something with the asset
        
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
        options.synchronous = YES;
        options.networkAccessAllowed = YES;
        options.progressHandler = ^(double progress, NSError *error, BOOL *stop, NSDictionary *info) {
            NSLog(@"%f", progress);
        };
        
        [manager requestImageDataForAsset:asset options:options resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
            [images addObject:imageData];
        }];
        
    }
    
    return images;
}

+(void)fetchVideoFromAsset:(PHAsset *)asset toURL:(NSURL *)url completion:(void (^)(void))completion{
    PHImageManager *manager = [PHImageManager defaultManager];
    
    PHVideoRequestOptions *options = [PHVideoRequestOptions new];
    options.networkAccessAllowed = YES;
    options.progressHandler = ^(double progress, NSError *error, BOOL *stop, NSDictionary *info) {
        NSLog(@"%f", progress);
    };
    
    [manager requestExportSessionForVideo:asset options:options exportPreset:AVAssetExportPresetHighestQuality resultHandler:^(AVAssetExportSession * _Nullable exportSession, NSDictionary * _Nullable info) {
        if ([info objectForKey:PHImageErrorKey] == nil)
        {
            exportSession.outputURL = url;
            
            NSArray<PHAssetResource *> *resources = [PHAssetResource assetResourcesForAsset:asset];
            for (PHAssetResource *resource in resources)
            {
                exportSession.outputFileType = resource.uniformTypeIdentifier;
                if (exportSession.outputFileType != nil)
                    break;
            }
            
            [exportSession exportAsynchronouslyWithCompletionHandler:^{
                completion();
            }];
        }
    }];
}

@end
