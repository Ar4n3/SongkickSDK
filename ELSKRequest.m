//
//  ELSKRequest.m
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 09/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import "ELSKRequest.h"

@implementation ELSKRequest

+ (void)setAPIKey:(NSString *)apiKey {
    
    kAPIKey = apiKey;
    
}

- (ELSKRequest *)GETRequestFor:(int)requestFor withParameters:(NSDictionary *)dictionary {
    
    NSString *parameterString = [[NSString alloc] init];
    NSString *requestString = [[NSString alloc]init];
    NSData *jsonResponse = [[NSData alloc]init];
    NSObject *jsonObject = [[NSObject alloc]init];
    NSString *searchString = [[NSString alloc]init];
    
    parameterString = [SongkickSDK getStringFromDictionary:dictionary];
    searchString = [SongkickSDK getSearchStringFromRequest:requestFor];
    
    if ((requestFor == ELSKSimilarArtistRequest) || (requestFor == ELSKUserTrackedArtistCalendarRequest) || (requestFor == ELSKUserAttendanceCalendarRequest) || (requestFor == ELSKUserTrackingEventsRequest) || (requestFor == ELSKUserTrackingArtistsRequest) || (requestFor == ELSKUserTrackingMutedArtistsRequest) || (requestFor == ELSKUserTrackingMetroAreasRequest)) {
        
        NSString *helperString = [[NSString alloc]initWithString:[NSString stringWithFormat:searchString,parameterString]];
        requestString = [NSString stringWithFormat:@"%@apikey=%@",helperString,kAPIKey];
        
    } else {
        
        requestString = [NSString stringWithFormat:@"%@%@&apikey=%@",searchString, parameterString, kAPIKey];
        requestString = [requestString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    }
    
    if (kAPIKey != nil) {
        
        NSURL *requestURL = [[NSURL alloc] initWithString:requestString];
        jsonResponse = [mockNSURLSessionDownloadTask initiateGETRequest:requestFor withURL:requestURL];
        jsonObject = [NSJSONSerialization JSONObjectWithData:jsonResponse options:0 error:nil];
        
        if (![jsonObject isKindOfClass:[NSDictionary class]]) {
            
            NSLog(@"ERROR: jsonObject is not a NSDictionary");
            
        } else {
            
            [self getResponseFrom:requestFor withDictionary:(NSDictionary *)jsonObject];
            return self;
            
        }
        
    }
    
    return nil;
    
}

- (void)getResponseFrom:(int)request withDictionary:(NSDictionary *)dictionary {
    
    NSDictionary *resultsPage = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"resultsPage"]];
    
    if ([[resultsPage objectForKey:@"status"] isEqualToString:@"ok"] && [resultsPage objectForKey:@"totalEntries"] > 0) {
        
        NSDictionary *artistCalendar = [[NSDictionary alloc]init];
        NSURL *eventRequestURL = [[NSURL alloc]init];
        
        switch (request) {
            case ELSKArtistsRequest:
                self.artist = [[ELSKArtist alloc]initWithContentsOfDictionary:resultsPage];
                
                artistCalendar = [self.artist.identifier objectAtIndex:0];
                eventRequestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?apikey=%@",[artistCalendar objectForKey:@"eventsHref"], kAPIKey]];
                
                self.events = [NSDictionary dictionaryWithDictionary:[ELSKEvent setEventWithDictionary:nil andRequest:eventRequestURL]];
                break;
                
            case ELSKEventsRequest:            
                self.events = [NSDictionary dictionaryWithDictionary:[ELSKEvent setEventWithDictionary:resultsPage andRequest:nil]];
                break;
                
            case ELSKVenuesRequest:
                self.venue = [[ELSKVenue alloc] initWithContentsOfDictionary:resultsPage];
                break;
                
            case ELSKLocationsRequest:
                self.location = [[ELSKLocation alloc] initWithContentsOfDictionary:resultsPage];
                break;
                
            case ELSKSimilarArtistRequest:
                self.similarArtist = [NSDictionary dictionaryWithDictionary:[ELSKArtist setArtistWithDictionary:resultsPage andRequest:nil]];
                break;
                
            case ELSKUserTrackedArtistCalendarRequest:
                self.userInfo = [[ELSKUserInfo alloc]init];
                self.userInfo.trackedArtistCalendar = [NSDictionary dictionaryWithDictionary:[ELSKUserInfo setUserCalendarWithDictionary:resultsPage andRequest:ELSKUserTrackedArtistCalendarRequest]];
                break;
            
            case ELSKUserAttendanceCalendarRequest:
                self.userInfo = [[ELSKUserInfo alloc]init];
                self.userInfo.attendanceCalendar = [NSDictionary dictionaryWithDictionary:[ELSKUserInfo setUserCalendarWithDictionary:resultsPage andRequest:ELSKUserAttendanceCalendarRequest]];
                break;
                
            case ELSKUserTrackingEventsRequest:
                self.userInfo = [[ELSKUserInfo alloc]init];
                self.userInfo.trackingEvents = [NSDictionary dictionaryWithDictionary:[ELSKUserInfo setUserCalendarWithDictionary:resultsPage andRequest:ELSKUserTrackingEventsRequest]];
                break;
            
            case ELSKUserTrackingArtistsRequest:
                self.userInfo = [[ELSKUserInfo alloc]init];
                self.userInfo.trackingArtists = [NSDictionary dictionaryWithDictionary:[ELSKUserInfo setUserTrackingArtistsWithDictionary:resultsPage]];
                break;
                
            case ELSKUserTrackingMutedArtistsRequest:
                self.userInfo = [[ELSKUserInfo alloc]init];
                self.userInfo.trackingMutedArtists = [NSDictionary dictionaryWithDictionary:[ELSKUserInfo setUserTrackingArtistsWithDictionary:resultsPage]];
                break;
                
            case ELSKUserTrackingMetroAreasRequest:
                self.userInfo = [[ELSKUserInfo alloc]init];
                self.userInfo.trackingMetroAreas = [NSDictionary dictionaryWithDictionary:[ELSKUserInfo setUserTrackingMetroAreaWithDictionary:resultsPage]];
                break;
                
            default:
                break;
        }
    }
    
}

@end
