//
//  BJWMovieController.m
//  swapi-C
//
//  Created by Bryan Workman on 6/25/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

#import "BJWMovieController.h"

static NSString * const baseURLString = @"https://swapi.dev/api/";
static NSString * const filmsComponent = @"films";

@implementation BJWMovieController

+ (void)fetchMovies:(void (^)(NSArray<BJWMovie *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:filmsComponent];
    
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL: finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion(nil);
        }
        
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if(!topLevelDictionary){
                NSLog(@"We had an error parsing the JSON %@", error.localizedDescription);
                return completion(nil);
            }
            
            NSMutableArray *moviesArray = [NSMutableArray new];
            
            for (NSDictionary *movieDict in topLevelDictionary[@"results"])
            {
                BJWMovie *movie = [[BJWMovie alloc] initWithDictionary:movieDict];
                [moviesArray addObject:movie];
            }
            completion(moviesArray);
        }
    }] resume];
}
@end
