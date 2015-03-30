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
    NSDictionary *results;
    if (dictionary == nil) {
        
        NSData *jsonData = [[NSData alloc]init];
        jsonData = [mockNSURLSessionDownloadTask initiateGETRequestEvents:requestURL];
        error = [[NSError alloc]init];
        jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        dictionary = (NSDictionary *)jsonObject;
        NSDictionary *resultsPage = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"resultsPage"]];
        
        if ([[resultsPage objectForKey:@"status"] isEqualToString:@"ok"] && [resultsPage objectForKey:@"totalEntries"] > 0) {
            
            results = [NSDictionary dictionaryWithDictionary:[resultsPage objectForKey:@"results"]];
        }
        
    } else {
        results = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"results"]];
    }
            
    if (results) {
        NSMutableDictionary *eventsMutableDictionary = [[NSMutableDictionary alloc]init];
        
        for (NSDictionary *event in [results objectForKey:@"event"]) {
            
            ELSKEvent *eventObject = [[ELSKEvent alloc]initEventFromDictionary:event];
            [eventsMutableDictionary setValue:eventObject forKey:eventObject.displayName];
            
        }
        
        NSDictionary *eventsDictionary = [NSDictionary dictionaryWithDictionary:eventsMutableDictionary];
        return eventsDictionary;
        
    }
    
    return nil;
    
}

- (ELSKEvent *)initEventFromDictionary:(NSDictionary *)event {
    
    self.type = [event objectForKey:@"type"];
    self.status= [event objectForKey:@"status"];
    self.popularity = [event objectForKey:@"popularity"];
    self.uri = [NSURL URLWithString:[event objectForKey:@"uri"]];
    self.displayName = [event objectForKey:@"displayName"];
    self.ageRestriction = [event objectForKey:@"ageRestriction"];
    self.start = [event objectForKey:@"start"];
    self.end = [event objectForKey:@"end"];
    self.series = [event objectForKey:@"series"];
    self.location = [event objectForKey:@"location"];
    self.idEvent = [event objectForKey:@"id"];
    self.performance = [event objectForKey:@"performance"];
    self.venue = [event objectForKey:@"venue"];
    
    return self;
    
}

@end
