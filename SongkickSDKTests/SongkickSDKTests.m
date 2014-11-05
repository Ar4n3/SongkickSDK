//
//  SongkickSDKTests.m
//  SongkickSDKTests
//
//  Created by Enara Lopez Otaegi on 25/03/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ELSKRequest.h"

@interface SongkickSDKTests : XCTestCase {
    ELSKRequest *myRequest;
    NSDictionary *parameters;
}
@end
static NSString *TEST_API_KEY=@"KLJHDFK7JEGPWEKJG80";

@implementation SongkickSDKTests

- (void)setUp {
    
    [super setUp];
    [ELSKRequest setAPIKey:TEST_API_KEY];
    
}

- (void)tearDown {
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
}

- (ELSKRequest *)createRequest:(int)option {
    
    myRequest = [[ELSKRequest alloc]init];
    switch (option) {
        case ELSKArtistsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"Foo Fighters", @"query", nil];
            myRequest = [myRequest GETRequestFor:ELSKArtistsRequest withParameters:parameters];
            break;
            
        case ELSKEventsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"sk:24580", @"location", @"2014-01-01", @"min_date", nil];
            myRequest = [myRequest GETRequestFor:ELSKEventsRequest withParameters:parameters];
            break;
            
        case ELSKVenuesRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"O2 Academy Brixton", @"query", nil];
            myRequest = [myRequest GETRequestFor:ELSKVenuesRequest withParameters:parameters];
            break;
            
        case ELSKLocationsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"london", @"query", nil];
            myRequest = [myRequest GETRequestFor:ELSKLocationsRequest withParameters:parameters];
            break;
            
        case ELSKSimilarArtistRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"68043", @"artist_id", nil];
            myRequest = [myRequest GETRequestFor:ELSKSimilarArtistRequest withParameters:parameters];
            break;
            
        case ELSKUserTrackedArtistCalendarRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            myRequest = [myRequest GETRequestFor:ELSKUserTrackedArtistCalendarRequest withParameters:parameters];
            break;
            
        case ELSKUserAttendanceCalendarRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            myRequest = [myRequest GETRequestFor:ELSKUserAttendanceCalendarRequest withParameters:parameters];
            break;
            
        case ELSKUserTrackingEventsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            myRequest = [myRequest GETRequestFor:ELSKUserTrackingEventsRequest withParameters:parameters];
            break;
            
        case ELSKUserTrackingArtistsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            myRequest = [myRequest GETRequestFor:ELSKUserTrackingArtistsRequest withParameters:parameters];
            break;
        
        case ELSKUserTrackingMutedArtistsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            myRequest = [myRequest GETRequestFor:ELSKUserTrackingMutedArtistsRequest withParameters:parameters];
            break;
            
        case ELSKUserTrackingMetroAreasRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            myRequest = [myRequest GETRequestFor:ELSKUserTrackingMetroAreasRequest withParameters:parameters];
            break;
            
        default:
            break;
    }
    return myRequest;
    
}

- (void)testELSKRequestObjectForArtistIsNotNil {
    
    [self createRequest:ELSKArtistsRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.artist != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForEventIsNotNil {
    
    [self createRequest:ELSKEventsRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.events != nil, @"myRequest is nil");
  
}

- (void)testELSKRequestObjectForVenueIsNotNil {
    
    [self createRequest:ELSKVenuesRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.venue != nil, @"myRequest is nil");

}

- (void)testELSKRequestObjectForLocationIsNotNil {
    
    [self createRequest:ELSKLocationsRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.location != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForSimilarArtistIsNotNil {
    
    [self createRequest:ELSKSimilarArtistRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.similarArtist != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserTrackedArtistCalendarIsNotNil {
    
    [self createRequest:ELSKUserTrackedArtistCalendarRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.trackedArtistCalendar != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserAttendanceCalendarIsNotNil {
    
    [self createRequest:ELSKUserAttendanceCalendarRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.attendanceCalendar != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserTrackingEventsIsNotNil {
    
    [self createRequest:ELSKUserTrackingEventsRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.trackingEvents != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserTrackingArtistsIsNotNil {
    
    [self createRequest:ELSKUserTrackingArtistsRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.trackingArtists != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserTrackingMutedArtistsIsNotNil {
    
    [self createRequest:ELSKUserTrackingMutedArtistsRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.trackingMutedArtists != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserTrackingMetroAreasIsNotNil {
    
    [self createRequest:ELSKUserTrackingMetroAreasRequest];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.trackingMetroAreas != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForArtistGigographyIsNotNil {
    
    [self createRequest:ELSKArtistGigography];
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.artist.gigography != nil, @"myRequest is nil");
    
}

@end
