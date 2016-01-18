//
//  BoardSpace.h
//  SnakesAndLadders
//
//  Created by Anthony Tulai on 2016-01-17.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Snake;
@class Ladder;

@interface BoardSpace : NSObject

@property (nonatomic, assign) BOOL snake;
@property (nonatomic, assign) BOOL ladder;
@property (nonatomic, assign) int snakeEndLocation;
@property (nonatomic, assign) int ladderEndLocation;

-(instancetype) init;
@end
