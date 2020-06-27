//
//  BJWMovie.h
//  swapi-C
//
//  Created by Bryan Workman on 6/25/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJWMovie : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *releaseDate;
@property (nonatomic, copy, readonly) NSString *openingCrawl;
@property (nonatomic, readonly) NSInteger episode;

- (instancetype) initWithTitle: (NSString *)title
                  releaseDate: (NSString *)releaseDate
                  openingCrawl: (NSString *)openingCrawl
                       episode: (NSInteger )episode;


@end

@interface BJWMovie (JSONConvertable)
- (BJWMovie *)initWithDictionary: (NSDictionary <NSString*, id>*)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
