//
//  LSIQuake.m
//  Quakes-Objc
//
//  Created by Nick Nguyen on 4/15/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIQuake.h"

@implementation LSIQuake


- (instancetype)initWithMagnitude:(NSNumber *)magnitude
                            place:(NSString *)place
                             time:(NSDate *)time
                         latitude:(double)latitude
                        longitude:(double)longitude {
    self = [super init];
    if (self) {
        _magnitude = magnitude;
        _place = [place copy];
        _time = time;
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    // Containers
    NSDictionary *properties = dictionary[@"properties"];
    NSDictionary *geometry = dictionary[@"geometry"];
    NSArray *coordinates = geometry[@"coordinates"];
    
    // Temporary variables to check for non-nil
    NSNumber *magnitude = properties[@"mag"];
    
    if ([magnitude isKindOfClass:[NSNull class]]) {
        magnitude = nil; // let's treat as an optional
    }
    
    
    NSString *place = properties[@"place"];
    NSNumber *timeNumber = properties[@"time"];
    // Prevent a crash, so we can gracefuly parse a JSON data without coordinates
    NSNumber *longitude = nil;
    NSNumber *latitude = nil;
    
    if (coordinates.count >= 2) {
        // longitude is first in the array
        longitude = coordinates[0];
        latitude = coordinates[1];
    }
    
  
    // if all required values are present, call the init method
    
    // All fields are required except magnitude to initialize
    
    if  (place && timeNumber && latitude && longitude) {
        // create the object
        NSDate *time = [NSDate dateWithTimeIntervalSince1970:timeNumber.longValue / 1000.0];
        
        self = [self initWithMagnitude:magnitude
                                 place:place time:time latitude:latitude.doubleValue longitude:longitude.doubleValue];
    } else {
        // return nil
        NSLog(@"Error: Invalid object, unable to parse, %@", dictionary);
        return nil;
    }
    
    return self;
}



@end
