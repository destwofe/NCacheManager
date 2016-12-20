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
#import "NFileDataModel.h"

@interface NCacheManager : NSObject

+(NCacheManager * _Nonnull)instance;

@property (nonatomic,strong) NSString * _Nonnull applicationGroupIdentifier;
@property (nonatomic,strong) NSNumber * _Nonnull maxImage;
@property (nonatomic,strong) NSNumber * _Nonnull maxVideo;
@property (nonatomic,strong) NSNumber * _Nonnull maxAudio;
@property (nonatomic,strong) NSNumber * _Nonnull maxFile;

-(NSArray<NSString *> * _Nonnull)getFileList:(NCacheType)type;

-(NFileDataModel * _Nonnull)getCachedFrom:(NSString * _Nonnull)path type:(NCacheType)type;

-(NSData * _Nonnull)getImageData:(NSString * _Nonnull)url name:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(NSData * _Nonnull)getImageData:(NSString * _Nonnull)url name:(NSString * _Nonnull)name;
-(NSData * _Nonnull)getImageData:(NSString * _Nonnull)url;

-(NSURL * _Nonnull)getImageURL:(NSString * _Nonnull)url name:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(NSURL * _Nonnull)getImageURL:(NSString * _Nonnull)url name:(NSString * _Nonnull)name;
-(NSURL * _Nonnull)getImageURL:(NSString * _Nonnull)url;

-(NSData * _Nonnull)getVideoData:(NSString * _Nonnull)url name:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(NSData * _Nonnull)getVideoData:(NSString * _Nonnull)url name:(NSString * _Nonnull)name;
-(NSData * _Nonnull)getVideoData:(NSString * _Nonnull)url;

-(NSURL * _Nonnull)getVideoURL:(NSString * _Nonnull)url name:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(NSURL * _Nonnull)getVideoURL:(NSString * _Nonnull)url name:(NSString * _Nonnull)name;
-(NSURL * _Nonnull)getVideoURL:(NSString * _Nonnull)url;

-(NSData * _Nonnull)getAudioData:(NSString * _Nonnull)url name:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(NSData * _Nonnull)getAudioData:(NSString * _Nonnull)url name:(NSString * _Nonnull)name;
-(NSData * _Nonnull)getAudioData:(NSString * _Nonnull)url;

-(NSURL * _Nonnull)getAudioURL:(NSString * _Nonnull)url name:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(NSURL * _Nonnull)getAudioURL:(NSString * _Nonnull)url name:(NSString * _Nonnull)name;
-(NSURL * _Nonnull)getAudioURL:(NSString * _Nonnull)url;

-(BOOL)saveImageData:(NSData * _Nonnull)data url:(NSString * _Nonnull)url name:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(BOOL)saveImageData:(NSData * _Nonnull)data url:(NSString * _Nonnull)url name:(NSString * _Nonnull)name;
-(BOOL)saveImageData:(NSData * _Nonnull)data url:(NSString * _Nonnull)url;

-(BOOL)saveVideoData:(NSData * _Nonnull)data url:(NSString * _Nonnull)url name:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(BOOL)saveVideoData:(NSData * _Nonnull)data url:(NSString * _Nonnull)url name:(NSString * _Nonnull)name;
-(BOOL)saveVideoData:(NSData * _Nonnull)data url:(NSString * _Nonnull)url;

-(BOOL)saveAudioData:(NSData * _Nonnull)data url:(NSString * _Nonnull)url name:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(BOOL)saveAudioData:(NSData * _Nonnull)data url:(NSString * _Nonnull)url name:(NSString * _Nonnull)name;
-(BOOL)saveAudioData:(NSData * _Nonnull)data url:(NSString * _Nonnull)url;

-(BOOL)removeImageWithname:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(BOOL)removeImageWithname:(NSString * _Nonnull)name;
-(BOOL)removeImageWithURL:(NSString * _Nonnull)url;

-(BOOL)removeAudioWithname:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(BOOL)removeAudioWithname:(NSString * _Nonnull)name;
-(BOOL)removeAudioWithURL:(NSString * _Nonnull)url;

-(BOOL)removeVideoWithname:(NSString * _Nonnull)name extension:(NSString * _Nonnull)ext;
-(BOOL)removeVideoWithname:(NSString * _Nonnull)name;
-(BOOL)removeVideoWithURL:(NSString * _Nonnull)url;

-(BOOL)renameImage:(NSString * _Nonnull)name newname:(NSString * _Nonnull)newname extension:(NSString * _Nonnull)ext;
-(BOOL)renameImage:(NSString * _Nonnull)name newname:(NSString * _Nonnull)newname;

-(BOOL)renameAudio:(NSString * _Nonnull)name newname:(NSString * _Nonnull)newname extension:(NSString * _Nonnull)ext;
-(BOOL)renameAudio:(NSString * _Nonnull)name newname:(NSString * _Nonnull)newname;

-(BOOL)renameVideo:(NSString * _Nonnull)name newname:(NSString * _Nonnull)newname extension:(NSString * _Nonnull)ext;
-(BOOL)renameVideo:(NSString * _Nonnull)name newname:(NSString * _Nonnull)newname;

-(NSURL * _Nonnull)saveFileFromAsset:(PHAsset * _Nonnull)asset;
-(NSArray<NSURL *> * _Nonnull)saveFileFromAssets:(NSArray<PHAsset *> * _Nonnull)assets;

@end
