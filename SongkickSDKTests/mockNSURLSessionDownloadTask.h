//
//  mockNSURLSessionDownloadTask.h
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 15/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ELSKRequest.h"

@interface mockNSURLSessionDownloadTask : NSObject

+ (NSData *)initiateGETRequest:(int)requestFor withURL:(NSURL *)request;
+ (NSData *)initiateGETRequestEvents:(NSURL *)request;

@end
