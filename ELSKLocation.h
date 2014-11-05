//
//  ELSKLocation.h
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 23/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELSKLocation : NSObject

@property (nonatomic) NSDictionary *city;
@property (nonatomic) NSDictionary *metroArea;

- (ELSKLocation *)initWithContentsOfDictionary:(NSDictionary *)dictionary;

@end
