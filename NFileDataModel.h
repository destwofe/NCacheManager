//
//  NFileDataModel.h
//  testNCacheManager
//
//  Created by Napat Yimjan on 11/27/2559 BE.
//  Copyright © 2559 Napat Yimjan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NFileDataModel : NSObject

typedef enum {
    NCacheTypeImage,
    NCacheTypeVideo,
    NCacheTypeAudio,
    NCacheTypeUnknow
} NCacheType;

@property NSString *path;
@property NSString *name;
@property NSString *extension;
@property NSURL *fileURL;
@property NSDate *createDate;
@property NSDate *updateDate;
@property NSNumber *size;
@property NSData *data;
@property NCacheType type;

-(instancetype)initWithPath:(NSString *)path name:(NSString *)name extension:(NSString *)extension fileURL:(NSURL *)fileURL createDate:(NSDate *)createDate updateDate:(NSDate *)updateDate size:(NSNumber *)size data:(NSData *)data type:(NCacheType)type;

//-(instancetype)initWithURL:(NSString *)url;

@end
