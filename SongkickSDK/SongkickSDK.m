//
//  SongkickSDK.m
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 25/03/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import "SongkickSDK.h"

NSString *kArtistSearchString = @"search/artist.json?";
NSString *kEventSearchString = @"events.json?";
NSString *kVenuesSearchString = @"search/venues.json?";
NSString *kLocationSearchString = @"search/locations.json?";
NSString *kSimilarArtistsSearchString = @"artists/%@/similar_artists.json?";
NSString *kUserTrackedArtistCalendarSearchString = @"users/%@/calendar.json?reason=tracked_artist&";
NSString *kUserAttendanceCalendarSearchString = @"users/%@/calendar.json?reason=attendance&";
NSString *kUserTrackingEventsSearchString = @"users/%@/events.json?";
NSString *kUserTrackingArtistsSearchString = @"users/%@/artists/tracked.json?";
NSString *kUserTrackingMutedArtistsSearchString = @"users/%@/artists/muted.json?";
NSString *kUserTrackingMetroAreaSearchString = @"users/%@/metro_areas/tracked.json?";
NSString *kArtistIdParameter = @"artist_id";
NSString *kUserParameter = @"username";
NSString *kAPIURL = @"http://api.songkick.com/api/3.0/";

@implementation SongkickSDK

+ (NSString *)getStringFromDictionary:(NSDictionary *)parameters {
    
    NSMutableArray *parametersArray = [NSMutableArray arrayWithCapacity:[parameters count]];
    
    for (NSString *key in [parameters allKeys]) {
        
        NSObject *value = [parameters objectForKey:key];
        if ([value isKindOfClass:[NSArray class]]) {
            
            for (NSString *arrayValue in (NSArray *)value) {
                
                if ([key isEqualToString:kArtistIdParameter] || [key isEqualToString:kUserParameter]) {
                    
                    [parametersArray addObject:[NSString stringWithFormat:@"{%@}", arrayValue]];
                    
                } else {
                    
                    [parametersArray addObject:[NSString stringWithFormat:@"%@=%@", key, arrayValue]];
                    
                }
                
            }
            
        } else {
            
            if ([key isEqualToString:kArtistIdParameter] || [key isEqualToString:kUserParameter]) {
                
                [parametersArray addObject:[NSString stringWithFormat:@"%@", value]];
                
            } else {
                
                [parametersArray addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
                
            }
            
        }
        
    }
    
    return [parametersArray componentsJoinedByString:@"&"];
    
}

+ (NSString *)getSearchStringFromRequest:(int)requestFor {
    
    NSString *searchString = [[NSString alloc]init];
    switch (requestFor) {
            
        case ELSKArtistsRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kArtistSearchString];
            
            break;
            
        case ELSKEventsRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kEventSearchString];
            
            break;
            
        case ELSKVenuesRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kVenuesSearchString];
            
            break;
            
        case ELSKLocationsRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kLocationSearchString];
            
            break;
            
        case ELSKSimilarArtistRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kSimilarArtistsSearchString];
            
            break;
            
        case ELSKUserTrackedArtistCalendarRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kUserTrackedArtistCalendarSearchString];
            
            break;
            
        case ELSKUserAttendanceCalendarRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kUserAttendanceCalendarSearchString];
            
            break;
            
        case ELSKUserTrackingEventsRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kUserTrackingEventsSearchString];
            
            break;
            
        case ELSKUserTrackingArtistsRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kUserTrackingArtistsSearchString];
            
            break;
            
        case ELSKUserTrackingMutedArtistsRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kUserTrackingMutedArtistsSearchString];
            
            break;
            
        case ELSKUserTrackingMetroAreasRequest:
            searchString = [NSString stringWithFormat:@"%@%@", kAPIURL, kUserTrackingMetroAreaSearchString];
            
            break;
            
        default:
            break;
            
    }
    
    return searchString;
    
}

@end
