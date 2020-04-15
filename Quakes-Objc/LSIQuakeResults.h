//
//  LSIQuakeResults.h
//  Quakes-Objc
//
//  Created by Nick Nguyen on 4/15/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LSIQuake;

@interface LSIQuakeResults : NSObject

@property (nonatomic, readonly, copy) NSArray<LSIQuake *> *quakes;

- (instancetype)initWithQuakes:(NSArray<LSIQuake *> *)quakes;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END


