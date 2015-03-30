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
            break;
            
        case ELSKEventsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"sk:24580", @"location", @"2014-01-01", @"min_date", nil];
            break;
            
        case ELSKVenuesRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"O2 Academy Brixton", @"query", nil];
            break;
            
        case ELSKLocationsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"london", @"query", nil];
            break;
            
        case ELSKSimilarArtistRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"68043", @"artist_id", nil];
            break;
            
        case ELSKUserTrackedArtistCalendarRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            break;
            
        case ELSKUserAttendanceCalendarRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            break;
            
        case ELSKUserTrackingEventsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            break;
            
        case ELSKUserTrackingArtistsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            break;
        
        case ELSKUserTrackingMutedArtistsRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            break;
            
        case ELSKUserTrackingMetroAreasRequest:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane", @"username", nil];
            break;
            
        case ELSKUserGigography:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"arane",@"username", nil];
            break;
            
        case ELSKArtistGigography:
            parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"11129128",@"artist_id", nil];
            break;
            
        default:
            break;
    }
    myRequest = [myRequest GETRequestFor:option withParameters:parameters];
    return myRequest;
    
}

- (void)testELSKRequestObjectForArtistIsNotNil {
    
    [self createRequest:ELSKArtistsRequest];
    NSLog(@"%@", myRequest.artist.displayName);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.artist != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForEventIsNotNil {
    
    [self createRequest:ELSKEventsRequest];
    ELSKEvent *event = [[myRequest.events allValues] objectAtIndex:0];
    NSLog(@"%@", event.displayName);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.events != nil, @"myRequest is nil");
  
}

- (void)testELSKRequestObjectForVenueIsNotNil {
    
    [self createRequest:ELSKVenuesRequest];
    NSLog(@"%@", myRequest.venue.capacity);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.venue != nil, @"myRequest is nil");

}

- (void)testELSKRequestObjectForLocationIsNotNil {
    
    [self createRequest:ELSKLocationsRequest];
    NSLog(@"%@", myRequest.location.city);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.location != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForSimilarArtistIsNotNil {
    
    [self createRequest:ELSKSimilarArtistRequest];
    ELSKArtist *artist = [[myRequest.similarArtist allValues] objectAtIndex:0];
    NSLog(@"%@", artist.displayName);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.similarArtist != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserTrackedArtistCalendarIsNotNil {
    
    [self createRequest:ELSKUserTrackedArtistCalendarRequest];
    ELSKEvent *event = [[myRequest.userInfo.trackedArtistCalendar allValues] objectAtIndex:0];
    NSLog(@"%@", event.displayName);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.trackedArtistCalendar != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserAttendanceCalendarIsNotNil {
    
    [self createRequest:ELSKUserAttendanceCalendarRequest];
    ELSKEvent *event = [[myRequest.userInfo.attendanceCalendar allValues] objectAtIndex:0];
    NSLog(@"%@", event.displayName);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.attendanceCalendar != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserTrackingEventsIsNotNil {
    
    [self createRequest:ELSKUserTrackingEventsRequest];
    ELSKEvent *event = [[myRequest.userInfo.trackingEvents allValues] objectAtIndex:0];
    NSLog(@"%@", event.displayName);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.trackingEvents != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserTrackingArtistsIsNotNil {
    
    [self createRequest:ELSKUserTrackingArtistsRequest];
    ELSKArtist *artist = [[myRequest.userInfo.trackingArtists allValues] objectAtIndex:0];
    NSLog(@"%@", artist.displayName);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.trackingArtists != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserTrackingMutedArtistsIsNotNil {
    
    [self createRequest:ELSKUserTrackingMutedArtistsRequest];
    ELSKArtist *artist = [[myRequest.userInfo.trackingMutedArtists allValues] objectAtIndex:0];
    NSLog(@"%@", artist.displayName);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.trackingMutedArtists != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserTrackingMetroAreasIsNotNil {
    
    [self createRequest:ELSKUserTrackingMetroAreasRequest];
    ELSKLocation *location = [[myRequest.userInfo.trackingMetroAreas allValues] objectAtIndex:0];
    NSLog(@"%@", location.metroArea);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.trackingMetroAreas != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForUserGigographyIsNotNil {
    
    [self createRequest:ELSKUserGigography];
    ELSKEvent *event = [[myRequest.userInfo.userGigography allValues] objectAtIndex:0];
    NSLog(@"%@", event.displayName);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.userInfo.userGigography != nil, @"myRequest is nil");
    
}

- (void)testELSKRequestObjectForArtistGigographyIsNotNil {
    
    [self createRequest:ELSKArtistGigography];
    ELSKEvent *artistGigography = [[myRequest.artist.gigography allValues] objectAtIndex:0];
    NSLog(@"%@", artistGigography.displayName);
    XCTAssert([myRequest isKindOfClass:[ELSKRequest class]], @"myRequest is not an ELSKRequest object");
    XCTAssert(myRequest.artist.gigography != nil, @"myRequest is nil");
    
}

@end
