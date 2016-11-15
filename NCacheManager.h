//
//  NCacheManager.h
//  MyCall
//
//  Created by Napat Yimjan on 10/14/2559 BE.
//  Copyright © 2559 MyNetwork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

#import "NUtils.h"

@interface NCacheManager : NSObject

+(NCacheManager *)instance;

typedef enum {
    NCacheTypeImage,
    NCacheTypeVideo,
    NCacheTypeAudio
} NCacheType;

@property (nonatomic,strong) NSString *applicationGroupIdentifier;
@property (nonatomic,strong) NSNumber *maxImage;
@property (nonatomic,strong) NSNumber *maxVideo;
@property (nonatomic,strong) NSNumber *maxAudio;

-(NSData *)getImageData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;
-(NSData *)getImageData:(NSString *)url Name:(NSString *)name;
-(NSData *)getImageData:(NSString *)url;

-(NSURL *)getImageURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;
-(NSURL *)getImageURL:(NSString *)url Name:(NSString *)name;
-(NSURL *)getImageURL:(NSString *)url;

-(NSData *)getVideoData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;
-(NSData *)getVideoData:(NSString *)url Name:(NSString *)name;
-(NSData *)getVideoData:(NSString *)url;

-(NSURL *)getVideoURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;
-(NSURL *)getVideoURL:(NSString *)url Name:(NSString *)name;
-(NSURL *)getVideoURL:(NSString *)url;

-(NSData *)getAudioData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;
-(NSData *)getAudioData:(NSString *)url Name:(NSString *)name;
-(NSData *)getAudioData:(NSString *)url;

-(NSURL *)getAudioURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;
-(NSURL *)getAudioURL:(NSString *)url Name:(NSString *)name;
-(NSURL *)getAudioURL:(NSString *)url;

-(BOOL)saveImageData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext;
-(BOOL)saveImageData:(NSData *)data url:(NSString *)url name:(NSString *)name;
-(BOOL)saveImageData:(NSData *)data url:(NSString *)url;

-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext;
-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url name:(NSString *)name;
-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url;

-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext;
-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url name:(NSString *)name;
-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url;

-(BOOL)removeImageWithName:(NSString *)name extension:(NSString *)ext;
-(BOOL)removeImageWithName:(NSString *)name;
-(BOOL)removeImageWithURL:(NSString *)url;

-(BOOL)removeAudioWithName:(NSString *)name extension:(NSString *)ext;
-(BOOL)removeAudioWithName:(NSString *)name;
-(BOOL)removeAudioWithURL:(NSString *)url;

-(BOOL)removeVideoWithName:(NSString *)name extension:(NSString *)ext;
-(BOOL)removeVideoWithName:(NSString *)name;
-(BOOL)removeVideoWithURL:(NSString *)url;

-(BOOL)renameImage:(NSString *)name newName:(NSString *)newName extension:(NSString *)ext;
-(BOOL)renameImage:(NSString *)name newName:(NSString *)newName;

-(BOOL)renameAudio:(NSString *)name newName:(NSString *)newName extension:(NSString *)ext;
-(BOOL)renameAudio:(NSString *)name newName:(NSString *)newName;

-(BOOL)renameVideo:(NSString *)name newName:(NSString *)newName extension:(NSString *)ext;
-(BOOL)renameVideo:(NSString *)name newName:(NSString *)newName;

-(NSString *)saveFileFromAsset:(PHAsset *)asset;
-(NSArray<NSString *> *)saveFileFromAssets:(NSArray<PHAsset *> *)assets;

@end
