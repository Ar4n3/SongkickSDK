//
//  ELSKArtist.h
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 15/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELSKArtist : NSObject

@property (nonatomic) NSString *displayName;
@property (nonatomic) NSString *idArtist;
@property (nonatomic) NSURL *uri;
@property (nonatomic) NSString *onTourUntil;
@property (nonatomic) NSArray *identifier;
@property (nonatomic) NSDictionary *gigography;

- (ELSKArtist *)initWithContentsOfDictionary:(NSDictionary *)dictionary;
+ (NSDictionary *)setArtistWithDictionary:(NSDictionary *)dictionary andRequest:(NSURL *)requestURL;

@end
