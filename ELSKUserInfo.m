//
//  ELSKUserInfo.m
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 24/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import "ELSKUserInfo.h"
#import "mockNSURLSessionDownloadTask.h"
#import "ELSKEvent.h"
#import "ELSKArtist.h"
#import "ELSKLocation.h"

@implementation ELSKUserInfo

+ (NSDictionary *)setUserCalendarWithDictionary:(NSDictionary *)dictionary andRequest:(int)request {
        
    NSDictionary *results = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"results"]];
    NSMutableDictionary *userCalendarMutableDictionary = [[NSMutableDictionary alloc]init];
    
    if (request == ELSKUserTrackingEventsRequest) {
        
        for (NSDictionary *event in [results objectForKey:@"event"]) {
            
            ELSKEvent *eventObject = [[ELSKEvent alloc]initEventFromDictionary:event];
            [userCalendarMutableDictionary setValue:eventObject forKey:eventObject.displayName];
            
        }
        
    } else {
        
        for (NSDictionary *calendarEntryDictionary in [results objectForKey:@"calendarEntry"]) {
            
            NSDictionary *event = [NSDictionary dictionaryWithDictionary:[calendarEntryDictionary objectForKey:@"event"]];
            ELSKEvent *eventObject = [[ELSKEvent alloc]initEventFromDictionary:event];
            [userCalendarMutableDictionary setValue:eventObject forKey:eventObject.displayName];
            [userCalendarMutableDictionary setValue:[calendarEntryDictionary objectForKey:@"reason"] forKey:@"reason"];
            
        }
        
    }
    
    NSDictionary *userCalendarDictionary = [NSDictionary dictionaryWithDictionary:userCalendarMutableDictionary];
    return userCalendarDictionary;
    
}

+ (NSDictionary *)setUserTrackingArtistsWithDictionary:(NSDictionary *)dictionary {
        
    NSDictionary *results = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"results"]];
    NSMutableDictionary *trackingArtistsMutableDictionary = [[NSMutableDictionary alloc]init];
        
    for (NSDictionary *artist in [results objectForKey:@"artist"]) {
        
        ELSKArtist *artistObject = [[ELSKArtist alloc]initWithContentsOfDictionary:artist];
        [trackingArtistsMutableDictionary setValue:artistObject forKey:artistObject.displayName];
        
    }
    
    NSDictionary *trackingArtistsDictionary = [NSDictionary dictionaryWithDictionary:trackingArtistsMutableDictionary];
    return trackingArtistsDictionary;
    
}

+ (NSDictionary *)setUserTrackingMetroAreaWithDictionary:(NSDictionary *)dictionary {
        
    NSDictionary *location = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"results"]];
    NSMutableDictionary *trackingMetroAreaMutableDictionary = [[NSMutableDictionary alloc]init];
    ELSKLocation *metroAreaObject = [[ELSKLocation alloc]init];
    metroAreaObject.metroArea = [location objectForKey:@"metroArea"];
    [trackingMetroAreaMutableDictionary setValue:metroAreaObject forKey:@"metroArea"];
    NSDictionary *trackingMetroAreaDictionary = [NSDictionary dictionaryWithDictionary:trackingMetroAreaMutableDictionary];
    return trackingMetroAreaDictionary;
    
}

+ (NSDictionary *)setUserGigographyWithDictionary:(NSDictionary *)dictionary {

    NSDictionary *results = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"results"]];
    NSMutableDictionary *gigographyMutableDictionary = [[NSMutableDictionary alloc] init];
    for (NSDictionary *event in [results objectForKey:@"event"]) {
        ELSKEvent *eventObject = [[ELSKEvent alloc] initEventFromDictionary:event];
        [gigographyMutableDictionary setValue:eventObject forKey:eventObject.displayName];
    }
    
    NSDictionary *gigographyDictionary = [NSDictionary dictionaryWithDictionary:gigographyMutableDictionary];
    return gigographyDictionary;
}

@end
