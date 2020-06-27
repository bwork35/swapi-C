//
//  BJWMovie.m
//  swapi-C
//
//  Created by Bryan Workman on 6/25/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

#import "BJWMovie.h"

@implementation BJWMovie

- (instancetype)initWithTitle:(NSString *)title releaseDate:(NSString *)releaseDate openingCrawl:(NSString *)openingCrawl episode:( NSInteger )episode
{
    self = [super init];
    if (self != nil)
    {
        _title = title;
        _releaseDate = releaseDate;
        _openingCrawl = openingCrawl;
        _episode = episode;
    }
    return self;
}

@end


@implementation BJWMovie (JSONConvertable)

- (BJWMovie *)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    NSString *title = topLevelDictionary[@"title"];
    NSString *releaseDate = topLevelDictionary[@"release_date"];
    NSString *openingCrawl = topLevelDictionary[@"opening_crawl"];
    NSInteger episode = [topLevelDictionary[@"episode_id"] intValue];
   
    return [self initWithTitle:title releaseDate:releaseDate openingCrawl:openingCrawl episode:episode];
}

@end
