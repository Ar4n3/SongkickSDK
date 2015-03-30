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
    
    self.displayName = [dictionary objectForKey:@"displayName"];
    self.idVenue = [dictionary objectForKey:@"id"];
    self.uri = [NSURL URLWithString:[dictionary objectForKey:@"uri"]];
    self.street = [dictionary objectForKey:@"street"];
    self.zip = [dictionary objectForKey:@"zip"];
    self.website = [NSURL URLWithString:[dictionary objectForKey:@"website"]];
    self.desc = [dictionary objectForKey:@"description"];
    self.phone = [dictionary objectForKey:@"phone"];
    self.metroArea = [dictionary objectForKey:@"metroArea"];
    self.capacity = [dictionary objectForKey:@"capacity"];
    self.city = [dictionary objectForKey:@"city"];
    self.uri = [NSURL URLWithString:[dictionary objectForKey:@"uri"]];
    self.lat = [[dictionary objectForKey:@"lat"] floatValue];
    self.lng = [[dictionary objectForKey:@"lng"] floatValue];
    
    return self;
    
}
@end
