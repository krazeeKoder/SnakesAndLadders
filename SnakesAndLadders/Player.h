//
//  Player.h
//  SnakesAndLadders
//
//  Created by Anthony Tulai on 2016-01-17.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (strong) NSString *name;
@property (assign) int location;
@property (assign) bool wonTheGame;
@property (assign) bool isTurn;

@end
