//
//  BJWMovieController.h
//  swapi-C
//
//  Created by Bryan Workman on 6/25/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BJWMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface BJWMovieController : NSObject

+(void)fetchMovies: (void (^) (NSArray<BJWMovie*> *movies))completion;

@end

NS_ASSUME_NONNULL_END
