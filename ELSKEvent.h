//
//  ELSKEvent.h
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 15/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELSKEvent : NSObject

@property (nonatomic) NSString *type;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *popularity;
@property (nonatomic) NSString *displayName;
@property (nonatomic) NSString *ageRestriction;
@property (nonatomic) NSDictionary *start;
@property (nonatomic) NSDictionary *end;
@property (nonatomic) NSDictionary *series;
@property (nonatomic) NSDictionary *location;
@property (nonatomic) NSURL *uri;
@property (nonatomic) NSString *idEvent;
@property (nonatomic) NSArray *performance;
@property (nonatomic) NSDictionary *venue;

+ (NSDictionary *)setEventWithDictionary:(NSDictionary *)dictionary andRequest:(NSURL *)requestURL;
+ (ELSKEvent *)initEventFromDictionary:(NSDictionary *)event;

@end
