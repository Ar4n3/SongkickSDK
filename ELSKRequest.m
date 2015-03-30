//
//  ELSKRequest.m
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 09/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import "ELSKRequest.h"
#import "SongkickSDKHelperString.h"
#import "mockNSURLSessionDownloadTask.h"
#import "ELSKArtist.h"
#import "ELSKEvent.h"
#import "ELSKVenue.h"
#import "ELSKLocation.h"
#import "ELSKUserInfo.h"

@interface ELSKRequest ()
@property (nonatomic) ELSKArtist *artist;
@property (nonatomic) NSDictionary *events;
@property (nonatomic) ELSKVenue *venue;
@property (nonatomic) ELSKLocation *location;
@property (nonatomic) NSDictionary *similarArtist;
@property (nonatomic) ELSKUserInfo *userInfo;
@end

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
    
    if ((requestFor == ELSKSimilarArtistRequest) || (requestFor == ELSKUserTrackedArtistCalendarRequest) || (requestFor == ELSKUserAttendanceCalendarRequest) || (requestFor == ELSKUserTrackingEventsRequest) || (requestFor == ELSKUserTrackingArtistsRequest) || (requestFor == ELSKUserTrackingMutedArtistsRequest) || (requestFor == ELSKUserTrackingMetroAreasRequest) || (requestFor == ELSKUserGigography) || (requestFor == ELSKArtistGigography)) {
        
        NSString *helperString = [[NSString alloc]initWithString:[NSString stringWithFormat:searchString,parameterString]];
        requestString = [NSString stringWithFormat:@"%@apikey=%@",helperString,kAPIKey];
        
    } else {
        
        requestString = [NSString stringWithFormat:@"%@%@&apikey=%@",searchString, parameterString, kAPIKey];
        requestString = [requestString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    }
    
    if (kAPIKey != nil) {
        
        NSError *errorJSONObject;
        NSURL *requestURL = [[NSURL alloc] initWithString:requestString];
        jsonResponse = [mockNSURLSessionDownloadTask initiateGETRequest:requestFor withURL:requestURL];
        jsonObject = [NSJSONSerialization JSONObjectWithData:jsonResponse options:0 error:&errorJSONObject];
        
        if (![jsonObject isKindOfClass:[NSDictionary class]]) {
            
            NSLog(@"ERROR: jsonObject is not a NSDictionary. %@", errorJSONObject.description);
            
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
        NSDictionary *results = [[NSDictionary alloc] init];
        
        switch (request) {
            case ELSKArtistsRequest:
                results = [NSDictionary dictionaryWithDictionary:[resultsPage objectForKey:@"results"]];
                for (NSDictionary *artist in [results objectForKey:@"artist"]) {
                    self.artist = [[ELSKArtist alloc]initWithContentsOfDictionary:artist];
                }
                
                artistCalendar = [self.artist.identifier objectAtIndex:0];
                eventRequestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?apikey=%@",[artistCalendar objectForKey:@"eventsHref"], kAPIKey]];
                
                self.events = [NSDictionary dictionaryWithDictionary:[ELSKEvent setEventWithDictionary:nil andRequest:eventRequestURL]];
                break;
                
            case ELSKEventsRequest:            
                self.events = [NSDictionary dictionaryWithDictionary:[ELSKEvent setEventWithDictionary:resultsPage andRequest:nil]];
                break;
                
            case ELSKVenuesRequest:
                results = [NSDictionary dictionaryWithDictionary:[resultsPage objectForKey:@"results"]];
                for (NSDictionary *venue in [results objectForKey:@"venue"]) {
                    self.venue = [[ELSKVenue alloc] initWithContentsOfDictionary:venue];
                }
                break;
                
            case ELSKLocationsRequest:
                results = [NSDictionary dictionaryWithDictionary:[resultsPage objectForKey:@"results"]];
                for (NSDictionary *venue in [results objectForKey:@"location"]) {
                    self.location = [[ELSKLocation alloc] initWithContentsOfDictionary:venue];
                }
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
                
            case ELSKUserGigography:
                self.userInfo = [[ELSKUserInfo alloc] init];
                self.userInfo.userGigography = [NSDictionary dictionaryWithDictionary:[ELSKUserInfo setUserGigographyWithDictionary:resultsPage]];
                break;
                
            case ELSKArtistGigography:
                self.artist = [[ELSKArtist alloc] init];
                self.artist.gigography = [NSDictionary dictionaryWithDictionary:[ELSKEvent setEventWithDictionary:resultsPage andRequest:nil]];
                break;
                
            default:
                break;
        }
    }
    
}

@end
