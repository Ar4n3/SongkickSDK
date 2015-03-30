//
//  ELSKRequest.h
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 09/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(int, ELSKRequestType)
{
    ELSKArtistsRequest = 0,
    ELSKEventsRequest = 1,
    ELSKVenuesRequest = 2,
    ELSKLocationsRequest = 3,
    ELSKSimilarArtistRequest = 4,
    ELSKUserTrackedArtistCalendarRequest = 5,
    ELSKUserAttendanceCalendarRequest = 6,
    ELSKUserTrackingEventsRequest = 7,
    ELSKUserTrackingArtistsRequest = 8,
    ELSKUserTrackingMutedArtistsRequest = 9,
    ELSKUserTrackingMetroAreasRequest = 10,
    ELSKArtistGigography = 11,
    ELSKUserGigography = 12
};

static NSString *kAPIKey = nil;

@interface ELSKRequest : NSObject

+ (void)setAPIKey:(NSString *)apiKey;
- (ELSKRequest *)GETRequestFor:(int)requestFor withParameters:(NSDictionary *)dictionary;
- (void)getResponseFrom:(int)request withDictionary:(NSDictionary *)dictionary;

@end
