//
//  ELSKVenue.h
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 23/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELSKVenue : NSObject

@property (nonatomic) NSString *idVenue;
@property (nonatomic) NSString *displayName;
@property (nonatomic) NSString *street;
@property (nonatomic) NSString *zip;
@property (nonatomic) NSURL *website;
@property (nonatomic) NSString *description;
@property (nonatomic) NSString *phone;
@property (nonatomic) NSDictionary *metroArea;
@property (nonatomic) NSString *capacity;
@property (nonatomic) NSDictionary *city;
@property (nonatomic) NSURL *uri;
@property (nonatomic) float lat;
@property (nonatomic) float lng;

- (ELSKVenue *)initWithContentsOfDictionary:(NSDictionary *)dictionary;

@end
