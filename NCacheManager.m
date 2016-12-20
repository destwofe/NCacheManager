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
        self.maxFile  = [NSNumber numberWithInt:100];
    }
    return self;
}

-(NSArray<NSString *> * _Nonnull)getFileList:(NCacheType)type{
    NSString *path = [self getContainer:type].path;
    return [self getDirectoryInformation:path];
}

-(NFileDataModel *)getCachedFrom:(NSString *)path type:(NCacheType)type{
    if (path == nil) {
        path = @"";
    }
    NSString *name = [self formatStringURLtoname:path];
    NSString *ext = [self validateExtension:@"" url:path type:type];
    
    NSString *filename = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFilenameWithExtension:filename type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:path]];
        if (data) {
            [self saveData:data nameWithExtension:filename type:type];
        }else{
            return nil;
        }
    }
    
    NSURL *fileURL = [[NSURL alloc]initWithString:filename];
    NSDictionary<NSFileAttributeKey,id> *fileAttri = [[NSFileManager defaultManager]attributesOfItemAtPath:[fileURL path] error:nil];
    
    NFileDataModel *nFileDataModel = [[NFileDataModel alloc]initWithPath:path name:name extension:ext fileURL:fileURL createDate:fileAttri.fileCreationDate updateDate:fileAttri.fileModificationDate size:[NSNumber numberWithLong:(long)fileAttri.fileSize] data:data type:type];
    
    return nFileDataModel;
}

-(NSData *)getImageData:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeImage;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoname:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *filename = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFilenameWithExtension:filename type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:filename type:type];
        }
    }
    return data;
}

-(NSData *)getImageData:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self getImageData:url name:name extension:ext];
}

-(NSData *)getImageData:(NSString *)url{
    NSString *name = [self formatStringURLtoname:url];
    NSString *ext = @"";
    return [self getImageData:url name:name extension:ext];
}

-(NSURL *)getImageURL:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeImage;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoname:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *filename = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFilenameWithExtension:filename type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:filename type:type];
            return [self generateFileURL:filename type:type];
        }
    }
    return nil;
}

-(NSURL *)getImageURL:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self getImageURL:url name:name extension:ext];
}

-(NSURL *)getImageURL:(NSString *)url{
    NSString *name = [self formatStringURLtoname:url];
    NSString *ext = @"";
    return [self getImageURL:url name:name extension:ext];
}

-(NSData *)getVideoData:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeVideo;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoname:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *filename = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFilenameWithExtension:filename type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:filename type:type];
        }
    }
    return data;
}

-(NSData *)getVideoData:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self getVideoData:url name:name extension:ext];
}

-(NSData *)getVideoData:(NSString *)url{
    NSString *ext = @"";
    NSString *name = [self formatStringURLtoname:url];
    return [self getVideoData:url name:name extension:ext];
}

-(NSURL *)getVideoURL:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeVideo;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoname:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *filename = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFilenameWithExtension:filename type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:filename type:type];
            return [self generateFileURL:filename type:type];
        }
    }
    return nil;
}

-(NSURL *)getVideoURL:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self getVideoURL:url name:name extension:ext];
}

-(NSURL *)getVideoURL:(NSString *)url{
    NSString *ext = @"";
    NSString *name = [self formatStringURLtoname:url];
    return [self getVideoURL:url name:name extension:ext];
}

-(NSData *)getAudioData:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeAudio;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoname:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *filename = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFilenameWithExtension:filename type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:filename type:type];
        }
    }
    return data;
}

-(NSData *)getAudioData:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self getAudioData:url name:name extension:ext];
}

-(NSData *)getAudioData:(NSString *)url{
    NSString *ext = @"";
    NSString *name = [self formatStringURLtoname:url];
    return [self getAudioData:url name:name extension:ext];
}

-(NSURL *)getAudioURL:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeAudio;
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoname:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *filename = [NSString stringWithFormat:@"%@.%@",name,ext];
    NSData *data = [self getDataFromFilenameWithExtension:filename type:type];
    if (!data) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            [self saveData:data nameWithExtension:filename type:type];
            return [self generateFileURL:filename type:type];
        }
    }
    return nil;
}

-(NSURL *)getAudioURL:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self getAudioURL:url name:name extension:ext];
}

-(NSURL *)getAudioURL:(NSString *)url{
    NSString *ext = @"";
    NSString *name = [self formatStringURLtoname:url];
    return [self getAudioURL:url name:name extension:ext];
}

-(BOOL)saveImageData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeImage;
    
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoname:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *filename = [NSString stringWithFormat:@"%@.%@",name,ext];
    
    return [self saveData:data nameWithExtension:filename type:type];
}


-(BOOL)saveImageData:(NSData *)data url:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self saveImageData:data url:url name:name extension:ext];
}

-(BOOL)saveImageData:(NSData *)data url:(NSString *)url{
    NSString *name = [self formatStringURLtoname:url];
    NSString *ext = @"";
    return [self saveImageData:data url:url name:name extension:ext];
}

-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeVideo;
    
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoname:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *filename = [NSString stringWithFormat:@"%@.%@",name,ext];
    
    return [self saveData:data nameWithExtension:filename type:type];
}


-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self saveVideoData:data url:url name:name extension:ext];
}

-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url{
    NSString *name = [self formatStringURLtoname:url];
    NSString *ext = @"";
    return [self saveVideoData:data url:url name:name extension:ext];
}

-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeAudio;
    
    if (url == nil) {
        url = @"";
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self formatStringURLtoname:url];
    }
    ext = [self validateExtension:ext url:url type:type];
    NSString *filename = [NSString stringWithFormat:@"%@.%@",name,ext];
    
    return [self saveData:data nameWithExtension:filename type:type];
}


-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url name:(NSString *)name{
    NSString *ext = @"";
    return [self saveAudioData:data url:url name:name extension:ext];
}

-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url{
    NSString *name = [self formatStringURLtoname:url];
    NSString *ext = @"";
    return [self saveAudioData:data url:url name:name extension:ext];
}

-(BOOL)removeImageWithname:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeImage;
    ext = [self validateExtension:ext url:@"" type:type];
    if (name == nil || [name isEqualToString:@""]) {
        return false;
    }
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)removeImageWithname:(NSString *)name{
    return [self removeImageWithname:name extension:@""];
}

-(BOOL)removeImageWithURL:(NSString *)url{
    NCacheType type = NCacheTypeImage;
    NSString *ext = [self validateExtension:@"" url:url type:type];
    NSString *name = [self formatStringURLtoname:url];
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)removeVideoWithname:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeVideo;
    ext = [self validateExtension:ext url:@"" type:type];
    if (name == nil || [name isEqualToString:@""]) {
        return false;
    }
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)removeVideoWithname:(NSString *)name{
    return [self removeImageWithname:name extension:@""];
}

-(BOOL)removeVideoWithURL:(NSString *)url{
    NCacheType type = NCacheTypeVideo;
    NSString *ext = [self validateExtension:@"" url:url type:type];
    NSString *name = [self formatStringURLtoname:url];
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)removeAudioWithname:(NSString *)name extension:(NSString *)ext{
    NCacheType type = NCacheTypeAudio;
    ext = [self validateExtension:ext url:@"" type:type];
    if (name == nil || [name isEqualToString:@""]) {
        return false;
    }
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)removeAudioWithname:(NSString *)name{
    return [self removeImageWithname:name extension:@""];
}

-(BOOL)removeAudioWithURL:(NSString *)url{
    NCacheType type = NCacheTypeAudio;
    NSString *ext = [self validateExtension:@"" url:url type:type];
    NSString *name = [self formatStringURLtoname:url];
    
    return [self removeFile:name extension:ext type:type];
}

-(BOOL)renameImage:(NSString *)name newname:(NSString *)newname extension:(NSString *)ext{
    NCacheType type = NCacheTypeImage;
    ext = [self validateExtension:ext url:@"" type:type];
    return [self renameFile:name newname:newname extension:ext type:type];
}

-(BOOL)renameImage:(NSString *)name newname:(NSString *)newname{
    return [self renameImage:name newname:newname extension:@""];
}

-(BOOL)renameVideo:(NSString *)name newname:(NSString *)newname extension:(NSString *)ext{
    NCacheType type = NCacheTypeVideo;
    ext = [self validateExtension:ext url:@"" type:type];
    return [self renameFile:name newname:newname extension:ext type:type];
}

-(BOOL)renameVideo:(NSString *)name newname:(NSString *)newname{
    return [self renameVideo:name newname:newname extension:@""];
}

-(BOOL)renameAudio:(NSString *)name newname:(NSString *)newname extension:(NSString *)ext{
    NCacheType type = NCacheTypeAudio;
    ext = [self validateExtension:ext url:@"" type:type];
    return [self renameFile:name newname:newname extension:ext type:type];
}

-(BOOL)renameAudio:(NSString *)name newname:(NSString *)newname{
    return [self renameAudio:name newname:newname extension:@""];
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

-(BOOL)renameFile:(NSString *)name newname:(NSString *)newname extension:(NSString *)ext type:(NCacheType)type{
    
    NSURL *container = [self getContainer:type];
    
    NSArray *filenameList = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:container includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
    for (NSURL *fileURL in filenameList) {
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
                return @"";
            }break;
        }
    }
    
    return ext;
}

-(NSData *)getDataFromFilenameWithExtension:(NSString *)name type:(NCacheType)type{
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
            container = [self getFileDirectory];
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
        }break;
        case NCacheTypeVideo:{
            container = [self getVideoDirectory];
        }break;
        case NCacheTypeAudio:{
            container = [self getAudioDirectory];
        }break;
        default:{
            container = [self getFileDirectory];
        }break;
    }
    fileURL = [container URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",name]];
    
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
            limit = self.maxFile.intValue;
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

    NSArray *filenameList = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:containerURL includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
    NSMutableDictionary *fileDict = [[NSMutableDictionary alloc]init];

    for (NSURL *filename in filenameList) {

        NSDate *modificationDate = [[NSFileManager defaultManager]attributesOfItemAtPath:[filename path] error:nil].fileModificationDate;
        if (!modificationDate) {
            modificationDate = [NSDate date];
        }
        [fileDict setValue:filename forKey:modificationDate.description];
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

    filenameList = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:containerURL includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
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

-(NSURL *)getFileDirectory{
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:self.applicationGroupIdentifier];
    containerURL = [containerURL URLByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/FileCache"]];
    
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

-(NSString *)formatStringURLtoname:(NSString *)url{
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:DONT_WANT_CHARACTER];
    NSString *name = [[url componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
    return name;
}

-(NSArray*)getDirectoryInformation:(NSString *)directoryPath{
    NSArray* dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:Nil];
    return dirs;
}

@end
