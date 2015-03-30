//
//  ELSKUserInfo.h
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 24/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELSKUserInfo : NSObject

@property (nonatomic) NSString *username;
@property (nonatomic) NSDictionary *trackedArtistCalendar;
@property (nonatomic) NSDictionary *attendanceCalendar;
@property (nonatomic) NSDictionary *trackingEvents;
@property (nonatomic) NSDictionary *trackingArtists;
@property (nonatomic) NSDictionary *trackingMutedArtists;
@property (nonatomic) NSDictionary *trackingMetroAreas;
@property (nonatomic) NSDictionary *userGigography;

+ (NSDictionary *)setUserCalendarWithDictionary:(NSDictionary *)dictionary andRequest:(int)request;
+ (NSDictionary *)setUserTrackingArtistsWithDictionary:(NSDictionary *)dictionary;
+ (NSDictionary *)setUserTrackingMetroAreaWithDictionary:(NSDictionary *)dictionary;
+ (NSDictionary *)setUserGigographyWithDictionary:(NSDictionary *)dictionary;
@end
