//
//  mockNSURLSessionDownloadTask.m
//  SongkickSDK
//
//  Created by Enara Lopez Otaegi on 15/04/14.
//  Copyright (c) 2014 Enara Lopez Otaegi. All rights reserved.
//

#import "mockNSURLSessionDownloadTask.h"

@implementation mockNSURLSessionDownloadTask

+ (NSData *)initiateGETRequest:(int)requestFor withURL:(NSURL *)request {
    
    NSString *requestObject = [[NSString alloc]init];
    
    switch (requestFor) {
        case ELSKArtistsRequest:
            requestObject = @"{\"resultsPage\": {\"results\": {\"artist\": [{\"uri\":\"http://www.songkick.com/artists/253846-radiohead\", \"displayName\":\"Foo Fighters\", \"id\":253846, \"onTourUntil\":\"2010-01-01\", \"identifier\":[{\"setlistsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:67f66c07-6e61-4026-ade5-7e782fad3a5d/setlists.json\", \"mbid\":\"67f66c07-6e61-4026-ade5-7e782fad3a5d\", \"eventsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:67f66c07-6e61-4026-ade5-7e782fad3a5d/calendar.json\", \"href\":\"http://api.songkick.com/api/3.0/artists/mbid:67f66c07-6e61-4026-ade5-7e782fad3a5d.json\"}]}]},\"totalEntries\":1,\"perPage\":50,\"page\":1,\"status\":\"ok\"}}";
            break;
        
        case ELSKEventsRequest:
            requestObject = @"{\"resultsPage\": {\"status\":\"ok\", \"totalEntries\": 2,\"perPage\": 50,\"page\": 1,\"results\": {\"event\": [{\"type\": \"Concert\",\"displayName\": \"Pixies at O2 Academy Brixton (October 9, 2009)\",\"venue\": {\"displayName\": \"O2 Academy Brixton\",\"id\": 17522},\"location\": { \"city\": \"London, UK\",\"lat\": null,\"lng\": null},\"start\": {\"date\": \"2009-10-09\",\"time\": \"19:00:00\"},\"performance\": [{\"displayName\": \"Pixies\",\"id\": 3681591}],\"uri\": \"http://www.songkick.com/concerts/2342061-pixies-at-o2-academy-brixton\",\"id\": 2342061},{\"type\": \"Concert\",\"displayName\": \"Pixies at O2 Academy Brixton (October 6, 2009)\",\"venue\": {\"displayName\": \"O2 Academy Brixton\",\"id\": 17522},\"start\": {\"date\": \"2009-10-06\",\"time\": \"19:00:00\"},\"location\": {\"city\": \"London, UK\",\"lat\": null,\"lng\": null},\"performance\": [{\"displayName\": \"Pixies\",\"id\": 3681541}],\"uri\": \"http://www.songkick.com/concerts/2342046-pixies-at-o2-academy-brixton\",\"id\": 2342046}]}}}";
            break;
            
        case ELSKVenuesRequest:
            requestObject = @"{\"resultsPage\":{\"results\":{\"venue\":[{\"id\":17522,\"displayName\":\"O2 Academy Brixton\",\"city\":{\"uri\":\"http://www.songkick.com/metro_areas/24426-uk-london\",\"displayName\":\"London\",\"country\":{\"displayName\":\"UK\"},\"id\":24426},\"metroArea\":{\"uri\":\"http://www.songkick.com/metro_areas/24426-uk-london\",\"displayName\":\"London\",\"country\":{\"displayName\":\"UK\"},\"id\":24426},\"uri\":\"http://www.songkick.com/venues/17522-o2-academy-brixton\",\"street\":\"211 Stockwell Road\", \"zip\":\"SW9 9SL\",\"lat\":51.4651268, \"lng\":-0.115187,\"phone\":\"020 7771 3000\",\"website\":\"http://www.brixton-academy.co.uk\",\"capacity\":4921,\"description\": \"Brixton Academy is an award winning music venue situated in the heart of Brixton, South London.\"} ]},\"totalEntries\":1,\"perPage\":50,\"page\":1,\"status\":\"ok\"}}";
            break;
            
        case ELSKLocationsRequest:
            requestObject = @"{\"resultsPage\":{\"results\":{\"location\":[{\"city\":{\"displayName\":\"London\",\"country\":{\"displayName\":\"UK\"},\"lng\":-0.128,\"lat\":51.5078},\"metroArea\":{\"uri\":\"http://www.songkick.com/metro_areas/24426-uk-london\",\"displayName\":\"London\",\"country\":{\"displayName\":\"UK\"},\"id\":24426,\"lng\":-0.128,\"lat\":51.5078}},{\"city\":{\"displayName\":\"London\",\"country\":{\"displayName\":\"US\"},\"lng\":null,\"lat\":null,\"state\":{\"displayName\":\"KY\"}},\"metroArea\":{\"uri\":\"http://www.songkick.com/metro_areas/24580\",\"displayName\":\"Lexington\",\"country\":{\"displayName\":\"US\"},\"id\":24580,\"lng\":-84.4947,\"lat\":38.0297,\"state\":{\"displayName\":\"KY\"}}}]},\"totalEntries\":2,\"perPage\":10,\"page\":1,\"status\":\"ok\"}}";
            break;
            
        case ELSKSimilarArtistRequest:
            requestObject = @"{\"resultsPage\": {\"results\": {\"artist\": [{\"displayName\": \"Gorillaz\",\"id\": 68043,\"identifier\": [{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:e21857d5-3256-4547-afb3-4b6ded592596/calendar.json\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:e21857d5-3256-4547-afb3-4b6ded592596.json\",\"mbid\": \"e21857d5-3256-4547-afb3-4b6ded592596\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:e21857d5-3256-4547-afb3-4b6ded592596/setlists.json\"}], \"onTourUntil\": null,\"uri\": \"http://www.songkick.com/artists/68043-gorillaz?utm_source=1976&utm_medium=partner\"}]},\"status\": \"ok\",\"perPage\": 50,\"page\": 1,\"totalEntries\": 183}}";
            break;
            
        case ELSKUserTrackedArtistCalendarRequest:
            requestObject = @"{\"resultsPage\": {\"status\": \"ok\",\"results\": {\"calendarEntry\": [{\"reason\": {\"trackedArtist\": [{\"onTourUntil\": \"2014-11-22\",\"displayName\": \"The Rolling Stones\",\"identifier\": [{\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:b071f9fa-14b0-4217-8e97-eb41da73f598/setlists.json\",\"mbid\": \"b071f9fa-14b0-4217-8e97-eb41da73f598\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:b071f9fa-14b0-4217-8e97-eb41da73f598.json\",\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:b071f9fa-14b0-4217-8e97-eb41da73f598/calendar.json\"},{\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:a52940ca-3ec9-4a2b-89e4-ad358f64c8f7/setlists.json\",\"mbid\": \"a52940ca-3ec9-4a2b-89e4-ad358f64c8f7\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:a52940ca-3ec9-4a2b-89e4-ad358f64c8f7.json\",\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:a52940ca-3ec9-4a2b-89e4-ad358f64c8f7/calendar.json\"}],\"uri\": \"http://www.songkick.com/artists/379603-rolling-stones?utm_source=26189&utm_medium=partner\",\"id\": 379603}]},\"event\": {\"type\": \"Concert\",\"status\": \"ok\",\"ageRestriction\": null,\"displayName\": \"The Rolling Stones at Estadio Santiago Bernabeu (June 25, 2014)\",\"start\": {\"time\": \"19:00:00\",\"date\": \"2014-06-25\",\"datetime\": \"2014-06-25T19:00:00+0100\"},\"location\": {\"city\": \"Madrid, Spain\",\"lat\": 40.4519885,\"lng\": -3.6887678},\"popularity\": 0.50289,\"uri\": \"http://www.songkick.com/concerts/19822794-rolling-stones-at-estadio-santiago-bernabeu?utm_source=26189&utm_medium=partner\",\"id\": 19822794,\"performance\": [{\"billingIndex\": 1,\"displayName\": \"The Rolling Stones\",\"billing\": \"headline\",\"id\": 39376664,\"artist\": {\"displayName\": \"The Rolling Stones\",\"identifier\": [{\"mbid\": \"b071f9fa-14b0-4217-8e97-eb41da73f598\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:b071f9fa-14b0-4217-8e97-eb41da73f598.json\"},{\"mbid\": \"a52940ca-3ec9-4a2b-89e4-ad358f64c8f7\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:a52940ca-3ec9-4a2b-89e4-ad358f64c8f7.json\"}],\"uri\": \"http://www.songkick.com/artists/379603-rolling-stones?utm_source=26189&utm_medium=partner\",\"id\": 379603}}],\"venue\": {\"displayName\": \"Estadio Santiago Bernabeu\",\"lat\": 40.4519885,\"metroArea\": {\"displayName\": \"Madrid\",\"country\": {\"displayName\": \"Spain\"},\"uri\": \"http://www.songkick.com/metro_areas/28755-spain-madrid?utm_source=26189&utm_medium=partner\",\"id\": 28755},\"lng\": -3.6887678,\"uri\": \"http://www.songkick.com/venues/70113-estadio-santiago-bernabeu?utm_source=26189&utm_medium=partner\",\"id\": 70113}},\"createdAt\": \"2014-03-07T08:34:31+0000\"}]},\"perPage\": 50,\"page\": 1,\"totalEntries\": 1}}";
            break;
            
        case ELSKUserAttendanceCalendarRequest:
            requestObject = @"{\"resultsPage\": {\"status\": \"ok\",\"results\": {\"calendarEntry\": [{\"reason\": {\"attendance\": \"i_might_go\"},\"event\": {\"type\": \"Concert\",\"status\": \"ok\",\"ageRestriction\": null,\"displayName\": \"The Rolling Stones at Estadio Santiago Bernabeu (June 25, 2014)\",\"start\": {\"time\": \"19:00:00\",\"date\": \"2014-06-25\",\"datetime\": \"2014-06-25T19:00:00+0100\"},\"location\": {\"city\": \"Madrid, Spain\",\"lat\": 40.4519885,\"lng\": -3.6887678},\"popularity\": 0.50289,\"uri\": \"http://www.songkick.com/concerts/19822794-rolling-stones-at-estadio-santiago-bernabeu?utm_source=26189&utm_medium=partner\",\"id\": 19822794,\"performance\": [{\"billingIndex\": 1,\"displayName\": \"The Rolling Stones\",\"billing\": \"headline\",\"id\": 39376664,\"artist\": {\"displayName\": \"The Rolling Stones\",\"identifier\": [{\"mbid\": \"b071f9fa-14b0-4217-8e97-eb41da73f598\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:b071f9fa-14b0-4217-8e97-eb41da73f598.json\"},{\"mbid\": \"a52940ca-3ec9-4a2b-89e4-ad358f64c8f7\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:a52940ca-3ec9-4a2b-89e4-ad358f64c8f7.json\"}],\"uri\": \"http://www.songkick.com/artists/379603-rolling-stones?utm_source=26189&utm_medium=partner\",\"id\": 379603}}],\"venue\": {\"displayName\": \"Estadio Santiago Bernabeu\",\"lat\": 40.4519885,\"metroArea\": {\"displayName\": \"Madrid\",\"country\": {\"displayName\": \"Spain\"},\"uri\": \"http://www.songkick.com/metro_areas/28755-spain-madrid?utm_source=26189&utm_medium=partner\",\"id\": 28755},\"lng\": -3.6887678,\"uri\": \"http://www.songkick.com/venues/70113-estadio-santiago-bernabeu?utm_source=26189&utm_medium=partner\",\"id\": 70113}},\"createdAt\": \"2014-03-07T08:34:31+0000\"}]},\"perPage\": 50,\"page\": 1,\"totalEntries\": 1}}";
            break;
            
        case ELSKUserTrackingEventsRequest:
            requestObject = @"{\"resultsPage\": {\"status\": \"ok\",\"results\": {\"event\": [{\"type\": \"Concert\",\"status\": \"ok\",\"ageRestriction\": null,\"displayName\": \"The Rolling Stones at Estadio Santiago Bernabeu (June 25, 2014)\",\"start\": {\"time\": \"19:00:00\",\"date\": \"2014-06-25\",\"datetime\": \"2014-06-25T19:00:00+0100\"},\"location\": {\"city\": \"Madrid, Spain\",\"lat\": 40.4519885,\"lng\": -3.6887678},\"popularity\": 0.50289,\"uri\": \"http://www.songkick.com/concerts/19822794-rolling-stones-at-estadio-santiago-bernabeu?utm_source=26189&utm_medium=partner\",\"id\": 19822794,\"performance\": [{\"billingIndex\": 1,\"displayName\": \"The Rolling Stones\",\"billing\": \"headline\",\"id\": 39376664,\"artist\": {\"displayName\": \"The Rolling Stones\",\"identifier\": [{\"mbid\": \"b071f9fa-14b0-4217-8e97-eb41da73f598\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:b071f9fa-14b0-4217-8e97-eb41da73f598.json\"},{\"mbid\": \"a52940ca-3ec9-4a2b-89e4-ad358f64c8f7\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:a52940ca-3ec9-4a2b-89e4-ad358f64c8f7.json\"}],\"uri\": \"http://www.songkick.com/artists/379603-rolling-stones?utm_source=26189&utm_medium=partner\",\"id\": 379603}}],\"venue\": {\"displayName\": \"Estadio Santiago Bernabeu\",\"lat\": 40.4519885,\"metroArea\": {\"displayName\": \"Madrid\",\"country\": {\"displayName\": \"Spain\"},\"uri\":\"http://www.songkick.com/metro_areas/28755-spain-madrid?utm_source=26189&utm_medium=partner\",\"id\": 28755},\"lng\": -3.6887678,\"uri\": \"http://www.songkick.com/venues/70113-estadio-santiago-bernabeu?utm_source=26189&utm_medium=partner\",\"id\": 70113}},{\"type\": \"Concert\",\"status\": \"ok\",\"popularity\": 0.008537,\"displayName\": \"Extremoduro at Auditorio Municipal De Daimiel (September 5, 2014)\",\"ageRestriction\": null,\"start\": {\"time\": \"22:00:00\",\"date\": \"2014-09-05\",\"datetime\": \"2014-09-05T22:00:00+0100\"},\"location\": {\"city\": \"Ciudad Real, Spain\",\"lat\": 38.9833,\"lng\": -3.93333},\"uri\": \"http://www.songkick.com/concerts/20025333-extremoduro-at-auditorio-municipal-de-daimiel?utm_source=26189&utm_medium=partner\",\"id\": 20025333,\"performance\": [{\"billingIndex\": 1,\"billing\": \"headline\",\"displayName\": \"Extremoduro\",\"id\": 39809893,\"artist\": {\"displayName\": \"Extremoduro\",\"identifier\": [{\"mbid\": \"f59163ba-1a7a-4349-b0fd-fb9582ebe333\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:f59163ba-1a7a-4349-b0fd-fb9582ebe333.json\"}],\"uri\": \"http://www.songkick.com/artists/217469-extremoduro?utm_source=26189&utm_medium=partner\",\"id\": 217469}}],\"venue\": {\"displayName\": \"Auditorio Municipal De Daimiel\",\"lat\": null,\"lng\": null,\"uri\": \"http://www.songkick.com/venues/795121-auditorio-municipal-de-daimiel?utm_source=26189&utm_medium=partner\",\"metroArea\": {\"displayName\": \"Ciudad Real\",\"country\": {\"displayName\": \"Spain\"},\"uri\": \"http://www.songkick.com/metro_areas/28724-spain-ciudad-real?utm_source=26189&utm_medium=partner\",\"id\": 28724},\"id\": 795121}}]},\"perPage\": 50,\"page\": 1,\"totalEntries\": 2}}";
            break;
            
        case ELSKUserTrackingArtistsRequest:
            requestObject = @"{\"resultsPage\": {\"status\": \"ok\",\"results\": {\"artist\": [{\"displayName\": \"Coldplay\",\"onTourUntil\": \"2014-07-01\",\"identifier\": [{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:cc197bad-dc9c-440d-a5b5-d52ba2e14234/calendar.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:cc197bad-dc9c-440d-a5b5-d52ba2e14234/setlists.json\",\"mbid\": \"cc197bad-dc9c-440d-a5b5-d52ba2e14234\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:cc197bad-dc9c-440d-a5b5-d52ba2e14234.json\"}],\"uri\": \"http://www.songkick.com/artists/197928-coldplay?utm_source=26189&utm_medium=partner\",\"id\": 197928},{\"identifier\": [{\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:67f66c07-6e61-4026-ade5-7e782fad3a5d/setlists.json\",\"mbid\": \"67f66c07-6e61-4026-ade5-7e782fad3a5d\",\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:67f66c07-6e61-4026-ade5-7e782fad3a5d/calendar.json\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:67f66c07-6e61-4026-ade5-7e782fad3a5d.json\"}],\"uri\": \"http://www.songkick.com/artists/29315-foo-fighters?utm_source=26189&utm_medium=partner\",\"displayName\": \"Foo Fighters\",\"id\": 29315,\"onTourUntil\": \"2014-06-21\"},{\"onTourUntil\": \"2014-07-06\",\"displayName\": \"Iron Maiden\",\"identifier\": [{\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:7c3762a3-51f8-4cf3-8565-1ee26a90efe2/setlists.json\",\"mbid\": \"7c3762a3-51f8-4cf3-8565-1ee26a90efe2\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:7c3762a3-51f8-4cf3-8565-1ee26a90efe2.json\",\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:7c3762a3-51f8-4cf3-8565-1ee26a90efe2/calendar.json\"},{\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:ca891d65-d9b0-4258-89f7-e6ba29d83767/setlists.json\",\"mbid\": \"ca891d65-d9b0-4258-89f7-e6ba29d83767\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:ca891d65-d9b0-4258-89f7-e6ba29d83767.json\",\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:ca891d65-d9b0-4258-89f7-e6ba29d83767/calendar.json\"}],\"uri\": \"http://www.songkick.com/artists/438390-iron-maiden?utm_source=26189&utm_medium=partner\",\"id\": 438390},{\"displayName\": \"John Mayer\",\"onTourUntil\": \"2014-11-20\",\"identifier\": [{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:144ef525-85e9-40c3-8335-02c32d0861f3/calendar.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:144ef525-85e9-40c3-8335-02c32d0861f3/setlists.json\",\"mbid\": \"144ef525-85e9-40c3-8335-02c32d0861f3\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:144ef525-85e9-40c3-8335-02c32d0861f3.json\"},{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:7a6eddfa-f6e7-43cd-b1bd-9925f5ba3880/calendar.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:7a6eddfa-f6e7-43cd-b1bd-9925f5ba3880/setlists.json\",\"mbid\": \"7a6eddfa-f6e7-43cd-b1bd-9925f5ba3880\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:7a6eddfa-f6e7-43cd-b1bd-9925f5ba3880.json\"},{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:8a81edd9-6f62-4ac7-afee-17dc0fec5fe7/calendar.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:8a81edd9-6f62-4ac7-afee-17dc0fec5fe7/setlists.json\",\"mbid\": \"8a81edd9-6f62-4ac7-afee-17dc0fec5fe7\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:8a81edd9-6f62-4ac7-afee-17dc0fec5fe7.json\"}],\"uri\": \"http://www.songkick.com/artists/442137-john-mayer?utm_source=26189&utm_medium=partner\",\"id\": 442137},{\"identifier\": [{\"mbid\": \"6b335658-22c8-485d-93de-0bc29a1d0349\",\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:6b335658-22c8-485d-93de-0bc29a1d0349/calendar.json\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:6b335658-22c8-485d-93de-0bc29a1d0349.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:6b335658-22c8-485d-93de-0bc29a1d0349/setlists.json\"}],\"displayName\": \"Judas Priest\",\"onTourUntil\": null,\"uri\": \"http://www.songkick.com/artists/313183-judas-priest?utm_source=26189&utm_medium=partner\",\"id\": 313183},{\"displayName\": \"Kaiser Chiefs\",\"onTourUntil\": \"2015-02-14\",\"identifier\": [{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:90218af4-4d58-4821-8d41-2ee295ebbe21/calendar.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:90218af4-4d58-4821-8d41-2ee295ebbe21/setlists.json\",\"mbid\": \"90218af4-4d58-4821-8d41-2ee295ebbe21\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:90218af4-4d58-4821-8d41-2ee295ebbe21.json\"}],\"uri\": \"http://www.songkick.com/artists/170094-kaiser-chiefs?utm_source=26189&utm_medium=partner\",\"id\": 170094},{\"displayName\": \"Kings of Leon\",\"onTourUntil\": \"2014-10-05\",\"identifier\": [{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:6ffb8ea9-2370-44d8-b678-e9237bbd347b/calendar.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:6ffb8ea9-2370-44d8-b678-e9237bbd347b/setlists.json\",\"mbid\": \"6ffb8ea9-2370-44d8-b678-e9237bbd347b\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:6ffb8ea9-2370-44d8-b678-e9237bbd347b.json\"}],\"uri\": \"http://www.songkick.com/artists/2847-kings-of-leon?utm_source=26189&utm_medium=partner\",\"id\": 2847},{\"displayName\": \"Mando Diao\",\"identifier\": [{\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:ea854cc1-13fc-4fd0-86a5-d2c7dba06764/setlists.json\",\"mbid\": \"ea854cc1-13fc-4fd0-86a5-d2c7dba06764\",\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:ea854cc1-13fc-4fd0-86a5-d2c7dba06764/calendar.json\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:ea854cc1-13fc-4fd0-86a5-d2c7dba06764.json\"}],\"uri\": \"http://www.songkick.com/artists/134966-mando-diao?utm_source=26189&utm_medium=partner\",\"id\": 134966,\"onTourUntil\": \"2014-08-14\"}]},\"perPage\": 50,\"page\": 1,\"totalEntries\": 13}}";
            break;
            
        case ELSKUserTrackingMutedArtistsRequest:
            requestObject = @"{\"resultsPage\": {\"status\": \"ok\",\"results\": {\"artist\": [{\"displayName\": \"Amaral\",\"onTourUntil\": \"2014-07-24\",\"identifier\": [{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:7a519099-d4c8-46c8-805b-214dab0e58a2/calendar.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:7a519099-d4c8-46c8-805b-214dab0e58a2/setlists.json\",\"mbid\": \"7a519099-d4c8-46c8-805b-214dab0e58a2\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:7a519099-d4c8-46c8-805b-214dab0e58a2.json\"}],\"uri\": \"http://www.songkick.com/artists/303248-amaral?utm_source=26189&utm_medium=partner\",\"id\": 303248},{\"identifier\": [{\"mbid\": \"bbad030f-bf55-4fc2-a643-248708e72f22\",\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:bbad030f-bf55-4fc2-a643-248708e72f22/calendar.json\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:bbad030f-bf55-4fc2-a643-248708e72f22.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:bbad030f-bf55-4fc2-a643-248708e72f22/setlists.json\"}],\"displayName\": \"Carlos Baute\",\"onTourUntil\": null,\"uri\": \"http://www.songkick.com/artists/428649-carlos-baute?utm_source=26189&utm_medium=partner\",\"id\": 428649},{\"onTourUntil\": \"2014-09-27\",\"identifier\": [ ],\"uri\": \"http://www.songkick.com/artists/3426471-dani-martin?utm_source=26189&utm_medium=partner\",\"displayName\": \"Dani Martin\",\"id\": 3426471},{\"displayName\": \"David Guetta\",\"onTourUntil\": \"2014-08-08\",\"identifier\": [{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:302bd7b9-d012-4360-897a-93b00c855680/calendar.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:302bd7b9-d012-4360-897a-93b00c855680/setlists.json\",\"mbid\": \"302bd7b9-d012-4360-897a-93b00c855680\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:302bd7b9-d012-4360-897a-93b00c855680.json\"}],\"uri\": \"http://www.songkick.com/artists/149066-david-guetta?utm_source=26189&utm_medium=partner\",\"id\": 149066},{\"onTourUntil\": null,\"identifier\": [{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:74508b04-b376-4f38-966c-f16d53eab3de/calendar.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:74508b04-b376-4f38-966c-f16d53eab3de/setlists.json\",\"mbid\": \"74508b04-b376-4f38-966c-f16d53eab3de\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:74508b04-b376-4f38-966c-f16d53eab3de.json\"},{\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:46e80ba0-5943-4715-ac2e-3bedcafa6107/calendar.json\",\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:46e80ba0-5943-4715-ac2e-3bedcafa6107/setlists.json\",\"mbid\": \"46e80ba0-5943-4715-ac2e-3bedcafa6107\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:46e80ba0-5943-4715-ac2e-3bedcafa6107.json\"}],\"uri\": \"http://www.songkick.com/artists/387099-dover?utm_source=26189&utm_medium=partner\",\"displayName\": \"Dover\",\"id\": 387099},{\"identifier\": [{\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:1a1cd7f3-e5df-4eca-bae2-2757c9e656b5/setlists.json\",\"mbid\": \"1a1cd7f3-e5df-4eca-bae2-2757c9e656b5\",\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:1a1cd7f3-e5df-4eca-bae2-2757c9e656b5/calendar.json\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:1a1cd7f3-e5df-4eca-bae2-2757c9e656b5.json\"}],\"uri\": \"http://www.songkick.com/artists/427500-duran-duran?utm_source=26189&utm_medium=partner\",\"displayName\": \"Duran Duran\",\"id\": 427500,\"onTourUntil\": null},{\"onTourUntil\": null,\"displayName\": \"El Pescao\",\"uri\": \"http://www.songkick.com/artists/3563896-el-pescao?utm_source=26189&utm_medium=partner\",\"identifier\": [{\"setlistsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:1f2e9775-e0ac-4eea-8379-4861c0521169/setlists.json\",\"mbid\": \"1f2e9775-e0ac-4eea-8379-4861c0521169\",\"href\": \"http://api.songkick.com/api/3.0/artists/mbid:1f2e9775-e0ac-4eea-8379-4861c0521169.json\",\"eventsHref\": \"http://api.songkick.com/api/3.0/artists/mbid:1f2e9775-e0ac-4eea-8379-4861c0521169/calendar.json\"}],\"id\": 3563896}]},\"perPage\": 50,\"page\": 1,\"totalEntries\": 17}}";
            break;

        case ELSKUserTrackingMetroAreasRequest:
            requestObject = @"{\"resultsPage\": {\"status\": \"ok\",\"results\": {\"metroArea\": [{\"lat\": 40.4,\"lng\": -3.68333,\"country\": {\"displayName\": \"Spain\"},\"uri\": \"http://www.songkick.com/metro_areas/28755-spain-madrid?utm_source=26189&utm_medium=partner\",\"displayName\": \"Madrid\",\"id\": 28755},{\"country\": {\"displayName\": \"Spain\"},\"lat\": 43.314362,\"lng\": -1.89968,\"displayName\": \"Renteria\",\"uri\": \"http://www.songkick.com/metro_areas/71606-spain-renteria?utm_source=26189&utm_medium=partner\",\"id\": 71606}]},\"perPage\": 50,\"page\": 1,\"totalEntries\": 2}}";
            break;
        
        case ELSKUserGigography:
            requestObject = @"{\"resultsPage\": {\"results\": { \"event\": [{\"id\":11129128,\"type\":\"Concert\",\"uri\":\"http://www.songkick.com/concerts/11129128-wild-flag-at-fillmore?utm_source=PARTNER_ID&utm_medium=partner\",\"displayName\":\"Wild Flag at The Fillmore (April 18, 2012)\",\"start\":{\"time\":\"20:00:00\",\"date\":\"2012-04-18\",\"datetime\":\"2012-04-18T20:00:00-0800\"},\"performance\":[{\"artist\":{\"uri\":\"http://www.songkick.com/artists/29835-wild-flag?utm_source=PARTNER_ID&utm_medium=partner\",\"displayName\":\"Wild Flag\",\"id\":29835,\"identifier\":[]},\"displayName\":\"Wild Flag\",\"billingIndex\":1,\"id\":21579303,\"billing\":\"headline\"}],\"location\":{\"city\":\"San Francisco, CA, US\",\"lng\":-122.4332937,\"lat\":37.7842398},\"venue\":{\"id\":6239,\"displayName\":\"The Fillmore\",\"uri\":\"http://www.songkick.com/venues/6239-fillmore?utm_source=PARTNER_ID&utm_medium=partner\",\"lng\":-122.4332937, \"lat\":37.7842398,\"metroArea\":{\"uri\":\"http://www.songkick.com/metro_areas/26330-us-sf-bay-area?utm_source=PARTNER_ID&utm_medium=partner\",\"displayName\":\"SF Bay Area\",\"country\":{\"displayName\":\"US\"},\"id\":26330,\"state\":{\"displayName\":\"CA\"}}},\"status\":\"ok\",\"popularity\":0.012763}]},\"totalEntries\":1,\"perPage\":50,\"page\":1,\"status\":\"ok\" }}";
            break;
        
        case ELSKArtistGigography:
            requestObject = @"{\"resultsPage\": {\"results\": { \"event\": [{\"id\":11129128,\"type\":\"Concert\",\"uri\":\"http://www.songkick.com/concerts/11129128-wild-flag-at-fillmore?utm_source=PARTNER_ID&utm_medium=partner\",\"displayName\":\"Wild Flag at The Fillmore (April 18, 2012)\",\"start\":{\"time\":\"20:00:00\",\"date\":\"2012-04-18\",\"datetime\":\"2012-04-18T20:00:00-0800\"},\"performance\":[{\"artist\":{\"uri\":\"http://www.songkick.com/artists/29835-wild-flag?utm_source=PARTNER_ID&utm_medium=partner\",\"displayName\":\"Wild Flag\",\"id\":29835,\"identifier\":[]},\"displayName\":\"Wild Flag\",\"billingIndex\":1,\"id\":21579303,\"billing\":\"headline\"}],\"location\":{\"city\":\"San Francisco, CA, US\",\"lng\":-122.4332937,\"lat\":37.7842398},\"venue\":{\"id\":6239,\"displayName\":\"The Fillmore\",\"uri\":\"http://www.songkick.com/venues/6239-fillmore?utm_source=PARTNER_ID&utm_medium=partner\",\"lng\":-122.4332937, \"lat\":37.7842398,\"metroArea\":{\"uri\":\"http://www.songkick.com/metro_areas/26330-us-sf-bay-area?utm_source=PARTNER_ID&utm_medium=partner\",\"displayName\":\"SF Bay Area\",\"country\":{\"displayName\":\"US\"},\"id\":26330,\"state\":{\"displayName\":\"CA\"}}},\"status\":\"ok\",\"popularity\":0.012763}]},\"totalEntries\":1,\"perPage\":50,\"page\":1,\"status\":\"ok\" }}";
            break;
    
        default:
            break;
    }
    
    NSData *requestJSON = [requestObject dataUsingEncoding:NSUTF8StringEncoding];
    return requestJSON;
    
}
+ (NSData *)initiateGETRequestEvents:(NSURL *)request {
    
    NSString *eventRequestObject = [[NSString alloc]init];
    eventRequestObject = @"{\"resultsPage\": {\"results\": { \"event\": [{\"id\":11129128,\"type\":\"Concert\",\"uri\":\"http://www.songkick.com/concerts/11129128-wild-flag-at-fillmore?utm_source=PARTNER_ID&utm_medium=partner\",\"displayName\":\"Wild Flag at The Fillmore (April 18, 2012)\",\"start\":{\"time\":\"20:00:00\",\"date\":\"2012-04-18\",\"datetime\":\"2012-04-18T20:00:00-0800\"},\"performance\":[{\"artist\":{\"uri\":\"http://www.songkick.com/artists/29835-wild-flag?utm_source=PARTNER_ID&utm_medium=partner\",\"displayName\":\"Wild Flag\",\"id\":29835,\"identifier\":[]},\"displayName\":\"Wild Flag\",\"billingIndex\":1,\"id\":21579303,\"billing\":\"headline\"}],\"location\":{\"city\":\"San Francisco, CA, US\",\"lng\":-122.4332937,\"lat\":37.7842398},\"venue\":{\"id\":6239,\"displayName\":\"The Fillmore\",\"uri\":\"http://www.songkick.com/venues/6239-fillmore?utm_source=PARTNER_ID&utm_medium=partner\",\"lng\":-122.4332937, \"lat\":37.7842398,\"metroArea\":{\"uri\":\"http://www.songkick.com/metro_areas/26330-us-sf-bay-area?utm_source=PARTNER_ID&utm_medium=partner\",\"displayName\":\"SF Bay Area\",\"country\":{\"displayName\":\"US\"},\"id\":26330,\"state\":{\"displayName\":\"CA\"}}},\"status\":\"ok\",\"popularity\":0.012763}]},\"totalEntries\":1,\"perPage\":50,\"page\":1,\"status\":\"ok\" }}";
    NSData *eventRequestJSON = [eventRequestObject dataUsingEncoding:NSUTF8StringEncoding];
    return eventRequestJSON;
    
}

@end
