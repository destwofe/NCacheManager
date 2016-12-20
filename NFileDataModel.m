//
//  NFileDataModel.m
//  testNCacheManager
//
//  Created by Napat Yimjan on 11/27/2559 BE.
//  Copyright © 2559 Napat Yimjan. All rights reserved.
//

#import "NFileDataModel.h"

@implementation NFileDataModel

-(instancetype)initWithPath:(NSString *)path name:(NSString *)name extension:(NSString *)extension fileURL:(NSURL *)fileURL createDate:(NSDate *)createDate updateDate:(NSDate *)updateDate size:(NSNumber *)size data:(NSData *)data type:(NCacheType)type{
    self = [super init];
    if (self) {
        self.path = path;
        self.name = name;
        self.extension = extension;
        self.fileURL = fileURL;
        self.createDate = createDate;
        self.updateDate = updateDate;
        self.size = size;
        self.data = data;
        self.type = type;
    }
    return self;
}

//-(instancetype)initWithURL:(NSString *)url{
//    self = [super init];
//    if (self) {
//        self.url = url;
//    }
//    return self;
//}


@end
