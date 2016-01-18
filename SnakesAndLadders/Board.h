//
//  Board.h
//  SnakesAndLadders
//
//  Created by Anthony Tulai on 2016-01-17.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BoardSpace;

@interface Board : NSObject

@property (strong) NSMutableArray *boardSpaces;

-(instancetype) init;

-(void) addSnakesAndLaddersForGameDifficulty:(int) gameDifficulty Board: (Board *)gameBoard ofLength: (int) length;

@end
