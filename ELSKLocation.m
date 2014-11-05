//
//  ELSKLocation.m
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 23/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import "ELSKLocation.h"

@implementation ELSKLocation
- (ELSKLocation *)initWithContentsOfDictionary:(NSDictionary *)dictionary {
        
    NSDictionary *results = [NSDictionary dictionaryWithDictionary:[dictionary objectForKey:@"results"]];
    
    for (NSDictionary *location in [results objectForKey:@"location"]) {
        
        self.metroArea = [location objectForKey:@"metroArea"];
        self.city = [location objectForKey:@"city"];
        
    }
    
    return self;
    
}
@end
