//
//  NCacheManager.m
//  MyCall
//
//  Created by Napat Yimjan on 10/14/2559 BE.
//  Copyright © 2559 MyNetwork. All rights reserved.
//

#import "NCacheManager.h"

#define DONT_WANT_CHARACTER @"/:.=&?"

@implementation NCacheManager

static NCacheManager *cacheManager = nil;

+(NCacheManager *)instance{
    if (cacheManager == nil) {
        cacheManager = [[NCacheManager alloc] init];
    }
    return cacheManager;
}

-(NSData *)getImageData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    if ([ext isEqualToString:@""]||ext == nil) {
        ext = [url pathExtension];
    }
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"png";
    }
    
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getImageDirectory]];
    }
    
    return data;
}

-(NSURL *)getImageURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    if ([ext isEqualToString:@""]||ext == nil) {
        ext = [url pathExtension];
    }
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"png";
    }
    
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getImageDirectory]];
    }
    
    return fileURL;
}

-(NSData *)getVideoData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    if ([ext isEqualToString:@""]||ext == nil) {
        ext = [url pathExtension];
    }
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"mp4";
    }
    
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getVideoDirectory]];
    }
    
    return data;
}

-(NSURL *)getVideoURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    if ([ext isEqualToString:@""]||ext == nil) {
        ext = [url pathExtension];
    }
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"mp4";
    }
    
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getVideoDirectory]];
    }
    
    return fileURL;
}

-(NSData *)getAudioData:(NSString *)url Name:(NSString *)name  extension:(NSString *)ext{
    if ([ext isEqualToString:@""]||ext == nil) {
        ext = [url pathExtension];
    }
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"m4a";
    }
    
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }
    
    return data;
}

-(NSURL *)getAudioURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    if ([ext isEqualToString:@""]||ext == nil) {
        ext = [url pathExtension];
    }
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"m4a";
    }
    
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }
    
    return fileURL;
}

-(NSData *)getImageData:(NSString *)url Name:(NSString *)name{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"png";
    }
    
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getImageDirectory]];
    }
    
    return data;
}

-(NSURL *)getImageURL:(NSString *)url Name:(NSString *)name{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"png";
    }
    
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getImageDirectory]];
    }
    
    return fileURL;
}

-(NSData *)getVideoData:(NSString *)url Name:(NSString *)name{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"mp4";
    }
    
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getVideoDirectory]];
    }
    
    return data;
}

-(NSURL *)getVideoURL:(NSString *)url Name:(NSString *)name{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"mp4";
    }
    
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getVideoDirectory]];
    }
    
    return fileURL;
}

-(NSData *)getAudioData:(NSString *)url Name:(NSString *)name{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"m4a";
    }
    
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }
    
    return data;
}

-(NSURL *)getAudioURL:(NSString *)url Name:(NSString *)name{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"m4a";
    }
    
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }
    
    return fileURL;
}

-(NSData *)getImageData:(NSString *)url{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"png";
    }
    
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getImageDirectory]];
    }

    return data;
}

-(NSURL *)getImageURL:(NSString *)url{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"png";
    }
    
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getImageDirectory]];
    }

    return fileURL;
}

-(NSData *)getVideoData:(NSString *)url{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"mp4";
    }
    
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getVideoDirectory]];
    }

    return data;
}

-(NSURL *)getVideoURL:(NSString *)url{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"mp4";
    }
    
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getVideoDirectory]];
    }

    return fileURL;
}

-(NSData *)getAudioData:(NSString *)url{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"m4a";
    }
    
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }

    return data;
}

-(NSURL *)getAudioURL:(NSString *)url{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"m4a";
    }
    
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];

    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    }

    return fileURL;
}

-(BOOL)saveImageData:(NSData *)data url:(NSString *)url{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"png";
    }
    
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    return [self saveData:data toURL:fileURL atContainer:[self getImageDirectory]];
}

-(BOOL)saveImageData:(NSData *)data url:(NSString *)url name:(NSString *)name{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"png";
    }
    
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    return [self saveData:data toURL:fileURL atContainer:[self getImageDirectory]];
}

-(BOOL)saveImageData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    if ([ext isEqualToString:@""]||ext == nil) {
        ext = [url pathExtension];
    }
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"png";
    }
    
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    return [self saveData:data toURL:fileURL atContainer:[self getImageDirectory]];
    
}

-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"mp4";
    }
    
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    return [self saveData:data toURL:fileURL atContainer:[self getVideoDirectory]];
}

-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url name:(NSString *)name{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"mp4";
    }
    
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    return [self saveData:data toURL:fileURL atContainer:[self getVideoDirectory]];
}

-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    if ([ext isEqualToString:@""]||ext == nil) {
        ext = [url pathExtension];
    }
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"mp4";
    }
    
    NSURL *fileURL = [[self getVideoDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    return [self saveData:data toURL:fileURL atContainer:[self getVideoDirectory]];
    
}

-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"m4a";
    }
    
    NSString *name = [self formatStringURLtoName:url];
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    return [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
}

-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url name:(NSString *)name{
    NSString *ext = [url pathExtension];
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"m4a";
    }
    
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    return [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
}

-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    if ([ext isEqualToString:@""]||ext == nil) {
        ext = [url pathExtension];
    }
    if ([ext isEqualToString:@""] || [self isExtensionFile:ext]) {
        ext = @"m4a";
    }
    
    NSURL *fileURL = [[self getAudioDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    return [self saveData:data toURL:fileURL atContainer:[self getAudioDirectory]];
    
}

-(BOOL)saveData:(NSData *)data toURL:(NSURL *)url atContainer:(NSURL *)containerURL{
    NSError *error;
    if ([data writeToURL:url options:NSDataWritingAtomic error:&error]) {
        //success cache
        [self removeChacheAtContainer:containerURL limite:10];
        return true;
    }else{
        NSLog(@"%@",error);
        return false;
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

-(BOOL)isExtensionFile:(NSString *)ext{
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:DONT_WANT_CHARACTER];
    return ([ext rangeOfCharacterFromSet:doNotWant].location == NSNotFound);
}

-(NSString *)formatStringURLtoName:(NSString *)url{
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:DONT_WANT_CHARACTER];
    NSString *name = [[url componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
    return name;
}

-(void)getDirectoryInformation:(NSString *)directoryPath{
    NSArray* dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:Nil];
    NSLog(@"%@",dirs.description);
}

@end
