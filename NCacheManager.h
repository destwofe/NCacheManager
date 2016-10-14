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

//-(void)set123Identifier:(NSString *)appGroupId;

-(NSData *)getImageData:(NSString *)url;
-(NSURL *) getImageURL:(NSString *)url;

-(NSData *)getVideoData:(NSString *)url;
-(NSURL *) getVideoURL:(NSString *)url;

-(NSData *)getAudioData:(NSString *)url;
-(NSURL *) getAudioURL:(NSString *)url;

@end
