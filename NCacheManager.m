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

-(instancetype)init{
    self = [super init];
    if (self) {
        self.maxImage = [NSNumber numberWithInt:100];
        self.maxVideo = [NSNumber numberWithInt:20];
        self.maxAudio = [NSNumber numberWithInt:40];
    }
    return self;
}

-(NSData *)getImageData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeImage;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoName:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFileNameWithExtension:fileName type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:fileName type:type];
        }
    }
    return data;
}

-(NSData *)getImageData:(NSString *)url Name:(NSString *)name{
    NSString *ext = @"";
    return [self getImageData:url Name:name extension:ext];
}

-(NSData *)getImageData:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSString *ext = @"";
    return [self getImageData:url Name:name extension:ext];
}

-(NSURL *)getImageURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeImage;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoName:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFileNameWithExtension:fileName type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:fileName type:type];
            return [self generateFileURL:fileName type:type];
        }
    }
    return nil;
}

-(NSURL *)getImageURL:(NSString *)url Name:(NSString *)name{
    NSString *ext = @"";
    return [self getImageURL:url Name:name extension:ext];
}

-(NSURL *)getImageURL:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSString *ext = @"";
    return [self getImageURL:url Name:name extension:ext];
}

-(NSData *)getVideoData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeVideo;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoName:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFileNameWithExtension:fileName type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:fileName type:type];
        }
    }
    return data;
}

-(NSData *)getVideoData:(NSString *)url Name:(NSString *)name{
    NSString *ext = @"";
    return [self getVideoData:url Name:name extension:ext];
}

-(NSData *)getVideoData:(NSString *)url{
    NSString *ext = @"";
    NSString *name = [self formatStringURLtoName:url];
    return [self getVideoData:url Name:name extension:ext];
}

-(NSURL *)getVideoURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeVideo;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoName:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFileNameWithExtension:fileName type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:fileName type:type];
            return [self generateFileURL:fileName type:type];
        }
    }
    return nil;
}

-(NSURL *)getVideoURL:(NSString *)url Name:(NSString *)name{
    NSString *ext = @"";
    return [self getVideoURL:url Name:name extension:ext];
}

-(NSURL *)getVideoURL:(NSString *)url{
    NSString *ext = @"";
    NSString *name = [self formatStringURLtoName:url];
    return [self getVideoURL:url Name:name extension:ext];
}

-(NSData *)getAudioData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeAudio;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoName:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFileNameWithExtension:fileName type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:fileName type:type];
        }
    }
    return data;
}

-(NSData *)getAudioData:(NSString *)url Name:(NSString *)name{
    NSString *ext = @"";
    return [self getAudioData:url Name:name extension:ext];
}

-(NSData *)getAudioData:(NSString *)url{
    NSString *ext = @"";
    NSString *name = [self formatStringURLtoName:url];
    return [self getAudioData:url Name:name extension:ext];
}

-(NSURL *)getAudioURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeAudio;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoName:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFileNameWithExtension:fileName type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:fileName type:type];
            return [self generateFileURL:fileName type:type];
        }
    }
    return nil;
}

-(NSURL *)getAudioURL:(NSString *)url Name:(NSString *)name{
    NSString *ext = @"";
    return [self getAudioURL:url Name:name extension:ext];
}

-(NSURL *)getAudioURL:(NSString *)url{
    NSString *ext = @"";
    NSString *name = [self formatStringURLtoName:url];
    return [self getAudioURL:url Name:name extension:ext];
}

-(BOOL)saveImageData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeImage;
    
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoName:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ext];
    
    return [self saveData:data nameWithExtension:fileName type:type];
}


-(BOOL)saveImageData:(NSData *)data url:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self saveImageData:data url:url name:name extension:ext];
}

-(BOOL)saveImageData:(NSData *)data url:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSString *ext = @"";
    return [self saveImageData:data url:url name:name extension:ext];
}

-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeVideo;
    
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoName:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ext];
    
    return [self saveData:data nameWithExtension:fileName type:type];
}


-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self saveVideoData:data url:url name:name extension:ext];
}

-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSString *ext = @"";
    return [self saveVideoData:data url:url name:name extension:ext];
}

-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeAudio;
    
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoName:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ext];
    
    return [self saveData:data nameWithExtension:fileName type:type];
}


-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self saveAudioData:data url:url name:name extension:ext];
}

-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url{
    NSString *name = [self formatStringURLtoName:url];
    NSString *ext = @"";
    return [self saveAudioData:data url:url name:name extension:ext];
}

-(BOOL)removeImageWithName:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeImage;
    ext = [self validateExtension:ext url:@"" type:type];
    if (name == nil || [name isEqualToString:@""]) {
        return false;
    }
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)removeImageWithName:(NSString *)name{
    return [self removeImageWithName:name extension:@""];
}

-(BOOL)removeImageWithURL:(NSString *)url{
    NCacheType type = NCacheTypeImage;
    NSString *ext = [self validateExtension:@"" url:url type:type];
    NSString *name = [self formatStringURLtoName:url];
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)removeVideoWithName:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeVideo;
    ext = [self validateExtension:ext url:@"" type:type];
    if (name == nil || [name isEqualToString:@""]) {
        return false;
    }
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)removeVideoWithName:(NSString *)name{
    return [self removeImageWithName:name extension:@""];
}

-(BOOL)removeVideoWithURL:(NSString *)url{
    NCacheType type = NCacheTypeVideo;
    NSString *ext = [self validateExtension:@"" url:url type:type];
    NSString *name = [self formatStringURLtoName:url];
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)removeAudioWithName:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeAudio;
    ext = [self validateExtension:ext url:@"" type:type];
    if (name == nil || [name isEqualToString:@""]) {
        return false;
    }
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)removeAudioWithName:(NSString *)name{
    return [self removeImageWithName:name extension:@""];
}

-(BOOL)removeAudioWithURL:(NSString *)url{
    NCacheType type = NCacheTypeAudio;
    NSString *ext = [self validateExtension:@"" url:url type:type];
    NSString *name = [self formatStringURLtoName:url];
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)renameImage:(NSString *)name newName:(NSString *)newName extension:(NSString *)ext{
    NCacheType type = NCacheTypeImage;
    ext = [self validateExtension:ext url:@"" type:type];
    return [self renameFile:name newName:newName extension:ext type:type];
}

-(BOOL)renameImage:(NSString *)name newName:(NSString *)newName{
    return [self renameImage:name newName:newName extension:@""];
}

-(BOOL)renameVideo:(NSString *)name newName:(NSString *)newName extension:(NSString *)ext{
    NCacheType type = NCacheTypeVideo;
    ext = [self validateExtension:ext url:@"" type:type];
    return [self renameFile:name newName:newName extension:ext type:type];
}

-(BOOL)renameVideo:(NSString *)name newName:(NSString *)newName{
    return [self renameVideo:name newName:newName extension:@""];
}

-(BOOL)renameAudio:(NSString *)name newName:(NSString *)newName extension:(NSString *)ext{
    NCacheType type = NCacheTypeAudio;
    ext = [self validateExtension:ext url:@"" type:type];
    return [self renameFile:name newName:newName extension:ext type:type];
}

-(BOOL)renameAudio:(NSString *)name newName:(NSString *)newName{
    return [self renameAudio:name newName:newName extension:@""];
}

-(NSURL *)saveFileFromAsset:(PHAsset *)asset{
    switch (asset.mediaType) {
        case PHAssetMediaTypeImage:{
            NSData *imageData = [NUtils getImageDataFromAsset:asset];
            NSArray *resources = [PHAssetResource assetResourcesForAsset:asset];
            NSString *orgFilename = ((PHAssetResource*)resources[0]).originalFilename;
            
            [self saveData:imageData nameWithExtension:orgFilename type:NCacheTypeImage];
            return [self generateFileURL:orgFilename type:NCacheTypeImage];
        }break;
        case PHAssetMediaTypeVideo:{
            NSArray *resources = [PHAssetResource assetResourcesForAsset:asset];
            NSString *orgFilename = ((PHAssetResource*)resources[0]).originalFilename;
            NSURL *newVideoURL = [[self getVideoDirectory] URLByAppendingPathComponent:orgFilename];
            
            dispatch_semaphore_t sema = dispatch_semaphore_create(0);
            
            [NUtils fetchVideoFromAsset:asset toURL:newVideoURL completion:^{
                
                dispatch_semaphore_signal(sema);
            }];
            dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
            
            return [self generateFileURL:orgFilename type:NCacheTypeVideo];
        }break;
        case PHAssetMediaTypeAudio:{
            
            return nil;
        }break;
        default:{
            return nil;
        }break;
    }
    return nil;
}

-(NSArray<NSURL *> *)saveFileFromAssets:(NSArray<PHAsset *> *)assets{
    NSMutableArray *urls = [[NSMutableArray alloc]init];
    for (PHAsset *asset in assets) {
        [urls addObject:[self saveFileFromAsset:asset]];
    }
    return [NSArray arrayWithArray:urls];
}


////////////////////////////////////////////////////////////////////////////////////

-(BOOL)renameFile:(NSString *)name newName:(NSString *)newName extension:(NSString *)ext type:(NCacheType)type{
    
    NSURL *container = [self getContainer:type];
    
    NSArray *fileNameList = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:container includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
    for (NSURL *fileURL in fileNameList) {
        NSString *filename = fileURL.lastPathComponent;
        if ([filename isEqualToString:[NSString stringWithFormat:@"%@.%@",name,ext]]) {
            NSData *data = [NSData dataWithContentsOfURL:fileURL];
            [self removeFile:name extension:ext type:type];
            return [self saveData:data nameWithExtension:filename type:type];
        }
    }
    return false;
}

-(NSString *)validateExtension:(NSString *)ext url:(NSString *)url type:(NCacheType)type{
    if ([ext isEqualToString:@""]||ext == nil) {
        if (url) {
            ext = [url pathExtension];
        }else{
            ext = @"";
        }
    }
    if ([ext isEqualToString:@""] || ![self isExtensionFile:ext]) {
        switch (type) {
            case NCacheTypeImage:{
                ext = @"png";
            }break;
            case NCacheTypeVideo:{
                ext = @"mp4";
            }break;
            case NCacheTypeAudio:{
                ext = @"m4a";
            }break;
            default:{
                return nil;
            }break;
        }
    }
    
    return ext;
}

-(NSData *)getDataFromFileNameWithExtension:(NSString *)name type:(NCacheType)type{
    NSURL *container;
    NSURL *fileURL;
    
    switch (type) {
        case NCacheTypeImage:{
            container = [self getImageDirectory];
            fileURL = [container URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];
        }break;
        case NCacheTypeVideo:{
            container = [self getVideoDirectory];
            fileURL = [container URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];
        }break;
        case NCacheTypeAudio:{
            container = [self getAudioDirectory];
            fileURL = [container URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];
        }break;
        default:{
            return false;
        }break;
    }
    
    return [NSData dataWithContentsOfURL:fileURL];
}

-(NSURL *)getContainer:(NCacheType)type{
    NSURL *container;
    
    switch (type) {
        case NCacheTypeImage:{
            container = [self getImageDirectory];
        }break;
        case NCacheTypeVideo:{
            container = [self getVideoDirectory];
        }break;
        case NCacheTypeAudio:{
            container = [self getAudioDirectory];
        }break;
        default:{
            return nil;
        }break;
    }
    
    return container;
}

-(NSURL *)generateFileURL:(NSString *)name type:(NCacheType)type{
    NSURL *container;
    NSURL *fileURL;
    
    switch (type) {
        case NCacheTypeImage:{
            container = [self getImageDirectory];
            fileURL = [container URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];
        }break;
        case NCacheTypeVideo:{
            container = [self getVideoDirectory];
            fileURL = [container URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];
        }break;
        case NCacheTypeAudio:{
            container = [self getAudioDirectory];
            fileURL = [container URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];
        }break;
        default:{
            return false;
        }break;
    }
    
    return fileURL;
}

-(int)getLimit:(NCacheType)type{
    int limit;
    
    switch (type) {
        case NCacheTypeImage:{
            limit = self.maxImage.intValue;
        }break;
        case NCacheTypeVideo:{
            limit = self.maxVideo.intValue;
        }break;
        case NCacheTypeAudio:{
            limit = self.maxAudio.intValue;
        }break;
        default:{
            return 0;
        }break;
    }
    
    return limit;
}

-(BOOL)saveData:(NSData *)data nameWithExtension:(NSString *)name type:(NCacheType)type{
    NSError *error;
    NSURL *container = [self getContainer:type];
    NSURL *fileURL = [self generateFileURL:name type:type];
    int limit = [self getLimit:type];
    
    if (data) {
        if ([data writeToFile:fileURL.path options:NSDataWritingAtomic error:&error]) {
            [self removeChacheAtContainer:container limite:limit];
            return true;
        }else{
            return false;
        }
    }
    return false;
}

-(BOOL)removeFile:(NSString*)name extension:(NSString *)ext type:(NCacheType)type{
    NSURL *fileURL = [[self getImageDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,ext]];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager removeItemAtPath:fileURL.path error:nil];
}

-(void)removeChacheAtContainer:(NSURL *)containerURL limite:(int)limit{

    NSLog(@"%@",containerURL.absoluteString);

    NSArray *fileNameList = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:containerURL includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
    NSMutableDictionary *fileDict = [[NSMutableDictionary alloc]init];

    for (NSURL *fileName in fileNameList) {

        NSDate *modificationDate = [[NSFileManager defaultManager]attributesOfItemAtPath:[fileName path] error:nil].fileModificationDate;
        if (!modificationDate) {
            modificationDate = [NSDate date];
        }
        [fileDict setValue:fileName forKey:modificationDate.description];
    }

    while ([[fileDict allKeys]count] > limit) {
        NSArray *dates = [fileDict allKeys];
        NSArray *sorted = [dates sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];

        //remove oldeset
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
