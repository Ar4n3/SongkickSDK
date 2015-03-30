//
//  ELSKArtist.m
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 15/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import "ELSKArtist.h"
#import "mockNSURLSessionDownloadTask.h"

@implementation ELSKArtist

- (ELSKArtist *)initWithContentsOfDictionary:(NSDictionary *)dictionary {
        
    self.displayName = [dictionary objectForKey:@"displayName"];
    self.idArtist = [dictionary objectForKey:@"id"];
    self.identifier = [dictionary objectForKey:@"identifier"];
    self.uri = [NSURL URLWithString:[dictionary objectForKey:@"uri"]];
    self.onTourUntil = [dictionary objectForKey:@"onTourUntil"];
    
    return self;
    
}

+ (NSDictionary *)setArtistWithDictionary:(NSDictionary *)dictionary andRequest:(NSURL *)requestURL {
    
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
    NSMutableDictionary *artistsMutableDictionary = [[NSMutableDictionary alloc]init];
    
    for (NSDictionary *artist in [results objectForKey:@"artist"]) {
        
        ELSKArtist *artistObject = [[ELSKArtist alloc]initWithContentsOfDictionary:artist];
        [artistsMutableDictionary setValue:artistObject forKey:artistObject.displayName];
        
    }
    
    NSDictionary *artistsDictionary = [NSDictionary dictionaryWithDictionary:artistsMutableDictionary];
    return artistsDictionary;
    
}

@end
