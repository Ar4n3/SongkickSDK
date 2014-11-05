//
//  ELSKVenue.m
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 23/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import "ELSKVenue.h"

@implementation ELSKVenue
- (ELSKVenue *)initWithContentsOfDictionary:(NSDictionary *)dictionary {
        
    NSDictionary *results = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"results"]];
    
    for (NSDictionary *venue in [results objectForKey:@"venue"]) {
        
        self.displayName = [venue objectForKey:@"displayName"];
        self.idVenue = [venue objectForKey:@"id"];
        self.uri = [NSURL URLWithString:[venue objectForKey:@"uri"]];
        self.street = [venue objectForKey:@"street"];
        self.zip = [venue objectForKey:@"zip"];
        self.website = [NSURL URLWithString:[venue objectForKey:@"website"]];
        self.description = [venue objectForKey:@"description"];
        self.phone = [venue objectForKey:@"phone"];
        self.metroArea = [venue objectForKey:@"metroArea"];
        self.capacity = [venue objectForKey:@"capacity"];
        self.city = [venue objectForKey:@"city"];
        self.uri = [NSURL URLWithString:[venue objectForKey:@"uri"]];
        self.lat = [[venue objectForKey:@"lat"] floatValue];
        self.lng = [[venue objectForKey:@"lng"] floatValue];
        
    }
    
    return self;
    
}
@end
