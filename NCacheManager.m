//
//  NCacheManager.m
//  MyCall
//
//  Created by Napat Yimjan on 10/14/2559 BE.
//  Copyright © 2559 MyNetwork. All rights reserved.
//

#import "NCacheManager.h"

@implementation NCacheManager

static NCacheManager *cacheManager = nil;

+(NCacheManager *)instance{
    if (cacheManager == nil) {
        cacheManager = [[NCacheManager alloc] init];
    }
    return cacheManager;
}

-(NSData *)getImageDataWithName:(NSString *)name URL:(NSString *)url{
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }
    
    return data;
}

-(NSURL *)getImageURLWithName:(NSString *)name URL:(NSString *)url{
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }
    
    return fileURL;
}

-(NSData *)getImageData:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }

    return data;
}

-(NSURL *)getImageURL:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }

    return fileURL;
}

-(NSData *)getVideoData:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp4",name]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }

    return data;
}

-(NSURL *)getVideoURL:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp4",name]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }

    return fileURL;
}

-(NSData *)getAudioData:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.m4a",name]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }

    return data;
}

-(NSURL *)getAudioURL:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.m4a",name]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }

    return fileURL;
}

-(void)saveData:(NSData *)data toURL:(NSURL *)url atContainer:(NSURL *)containerURL{
    NSError *error;
    if ([data writeToURL:url options:NSDataWritingAtomic error:&error]) {
        //success cache
        [self removeChacheAtContainer:containerURL limite:10];
    }else{
        NSLog(@"%@",error);
    }
}

-(void)removeChacheAtContainer:(NSURL *)containerURL limite:(int)limit{

    NSLog(@"%@",containerURL.absoluteString);

    NSArray *fileNameList = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:containerURL includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
    NSMutableDictionary *fileDict = [[NSMutableDictionary alloc]init];

    for (NSURL *fileName in fileNameList) {

        NSDate *modificationDate = [[NSFileManager defaultManager]attributesOfItemAtPath:[fileName path] error:nil].fileModificationDate;
        [fileDict setValue:fileName forKey:modificationDate.description];
    }

    while ([[fileDict allKeys]count] > limit) {
        NSArray *dates = [fileDict allKeys];
        NSArray *sorted = [dates sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];

        //delete oldeset
        NSFileManager *manager = [NSFileManager defaultManager];
        [manager removeItemAtPath:[fileDict objectForKey:[sorted objectAtIndex:0]] error:nil];
        [fileDict removeObjectForKey:[sorted objectAtIndex:0]];
    }

    fileNameList = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:containerURL includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
}

-(NSURL *)getVideoDirectory{
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:self.applicationGroupIdentifier];
    containerURL = [containerURL URLByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/VideoCache"]];

    [[NSFileManager defaultManager] createDirectoryAtPath:[containerURL path]
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:nil];

    return containerURL;
}

-(NSURL *)getAudioDirectory{
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:self.applicationGroupIdentifier];
    containerURL = [containerURL URLByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/AudioCache"]];

    [[NSFileManager defaultManager] createDirectoryAtPath:[containerURL path]
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:nil];

    return containerURL;
}

-(NSURL *)getImageDirectory{
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:self.applicationGroupIdentifier];
    containerURL = [containerURL URLByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/ImageCache"]];

    [[NSFileManager defaultManager] createDirectoryAtPath:[containerURL path]
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:nil];

    return containerURL;
}

-(NSString *)formatStringURLtoName:(NSString *)url{
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"/:."];
    NSString *name = [[url componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
    return name;
}

-(void)getDirectoryInformation:(NSString *)directoryPath{
    NSArray* dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:Nil];
    NSLog(@"%@",dirs.description);
}

@end
