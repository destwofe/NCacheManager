//
//  NCacheManager.h
//  MyCall
//
//  Created by Napat Yimjan on 10/14/2559 BE.
//  Copyright © 2559 MyNetwork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NCacheManager : NSObject

+(NCacheManager *)instance;

@property (nonatomic,strong) NSString *applicationGroupIdentifier;

-(NSData *)getImageData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;
-(NSURL *)getImageURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;

-(NSData *)getVideoData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;
-(NSURL *)getVideoURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;

-(NSData *)getAudioData:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;
-(NSURL *)getAudioURL:(NSString *)url Name:(NSString *)name extension:(NSString *)ext;

-(NSData *)getImageData:(NSString *)url Name:(NSString *)name;
-(NSURL *)getImageURL:(NSString *)url Name:(NSString *)name;

-(NSData *)getVideoData:(NSString *)url Name:(NSString *)name;
-(NSURL *)getVideoURL:(NSString *)url Name:(NSString *)name;

-(NSData *)getAudioData:(NSString *)url Name:(NSString *)name;
-(NSURL *)getAudioURL:(NSString *)url Name:(NSString *)name;

-(NSData *)getImageData:(NSString *)url;
-(NSURL *) getImageURL:(NSString *)url;

-(NSData *)getVideoData:(NSString *)url;
-(NSURL *) getVideoURL:(NSString *)url;

-(NSData *)getAudioData:(NSString *)url;
-(NSURL *) getAudioURL:(NSString *)url;

-(BOOL)saveImageData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext;
-(BOOL)saveImageData:(NSData *)data url:(NSString *)url name:(NSString *)name;
-(BOOL)saveImageData:(NSData *)data url:(NSString *)url;

-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext;
-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url name:(NSString *)name;
-(BOOL)saveVideoData:(NSData *)data url:(NSString *)url;

-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url name:(NSString *)name extension:(NSString *)ext;
-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url name:(NSString *)name;
-(BOOL)saveAudioData:(NSData *)data url:(NSString *)url;

@end
