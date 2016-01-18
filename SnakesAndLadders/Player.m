//
//  Player.m
//  SnakesAndLadders
//
//  Created by Anthony Tulai on 2016-01-17.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype) init {
    self = [super init];
    if (self) {
        _wonTheGame = NO;
        _location = -1;
    }
    return self;
}

@end
