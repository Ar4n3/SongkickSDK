//
//  SongkickSDK.h
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 25/03/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ELSKRequest.h"

@interface SongkickSDK : NSObject

+ (NSString *)getStringFromDictionary:(NSDictionary *)parameters;
+ (NSString *)getSearchStringFromRequest:(int)requestFor;

@end
