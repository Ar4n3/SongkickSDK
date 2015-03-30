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
    
    self.metroArea = [dictionary objectForKey:@"metroArea"];
    self.city = [dictionary objectForKey:@"city"];
    
    return self;
    
}
@end
