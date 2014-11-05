//
//  ELSKEvent.m
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 15/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import "ELSKEvent.h"
#import "mockNSURLSessionDownloadTask.h"

@implementation ELSKEvent

+ (NSDictionary *)setEventWithDictionary:(NSDictionary *)dictionary andRequest:(NSURL *)requestURL {
    
    NSObject *jsonObject = [[NSObject alloc]init];
    NSError *error = [[NSError alloc]init];
    if (dictionary == nil) {
        
        NSData *jsonData = [[NSData alloc]init];
        jsonData = [mockNSURLSessionDownloadTask initiateGETRequestEvents:requestURL];
        error = [[NSError alloc]init];
        jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        dictionary = (NSDictionary *)jsonObject;
        
    }
            
    NSDictionary *results = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"results"]];
    NSMutableDictionary *eventsMutableDictionary = [[NSMutableDictionary alloc]init];
    
    for (NSDictionary *event in [results objectForKey:@"event"]) {
        
        ELSKEvent *eventObject = [[ELSKEvent alloc]init];
        eventObject = [ELSKEvent initEventFromDictionary:event];
        [eventsMutableDictionary setValue:eventObject forKey:eventObject.displayName];
        
    }
    
    NSDictionary *eventsDictionary = [NSDictionary dictionaryWithDictionary:eventsMutableDictionary];
    return eventsDictionary;
    
}

+ (ELSKEvent *)initEventFromDictionary:(NSDictionary *)event {

    ELSKEvent *eventObject = [[ELSKEvent alloc]init];
    eventObject.type = [event objectForKey:@"type"];
    eventObject.status = [event objectForKey:@"status"];
    eventObject.popularity = [event objectForKey:@"popularity"];
    eventObject.uri = [NSURL URLWithString:[event objectForKey:@"uri"]];
    eventObject.displayName = [event objectForKey:@"displayName"];
    eventObject.ageRestriction = [event objectForKey:@"ageRestriction"];
    eventObject.start = [event objectForKey:@"start"];
    eventObject.end = [event objectForKey:@"end"];
    eventObject.series = [event objectForKey:@"series"];
    eventObject.location = [event objectForKey:@"location"];
    eventObject.idEvent = [event objectForKey:@"id"];
    eventObject.performance = [event objectForKey:@"performance"];
    eventObject.venue = [event objectForKey:@"venue"];
    
    return eventObject;
    
}

@end
