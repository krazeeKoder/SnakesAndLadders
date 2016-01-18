//
//  BoardSpace.m
//  SnakesAndLadders
//
//  Created by Anthony Tulai on 2016-01-17.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "BoardSpace.h"

@implementation BoardSpace;

-(instancetype) init{
    self = [super init];
    if (self) {
        _ladder = NO;
        _snake = NO;
    }
    return self;
}

@end
