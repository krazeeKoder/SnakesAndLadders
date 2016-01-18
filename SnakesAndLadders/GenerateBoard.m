//
//  GenerateBoard.m
//  SnakesAndLadders
//
//  Created by Anthony Tulai on 2016-01-17.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "GenerateBoard.h"
#import "BoardSpace.h"
#import "Board.h"
#import "SetSnakes.h"
#import "SetLadders.h"


@implementation GenerateBoard

-(Board *)setBoardOfSize:(int)size {
    Board *board = [[Board alloc]init];
    
    for (int i = 0; i<size*size; i++) {
        BoardSpace *currentSpace = [[BoardSpace alloc] init];
        [board.boardSpace addObject:currentSpace];
    }
    
    
}


@end
