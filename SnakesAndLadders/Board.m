//
//  Board.m
//  SnakesAndLadders
//
//  Created by Anthony Tulai on 2016-01-17.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "Board.h"
#import "BoardSpace.h"

@implementation Board

-(instancetype) init {
    self = [super init];
    if (self) {
        _boardSpaces = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void) addSnakesAndLaddersForGameDifficulty:(int) gameDifficulty Board: (Board *)gameBoard ofLength: (int) length {
    int numberOfSnakes = length * 2;
    
    if (gameDifficulty == 0) {
        numberOfSnakes = length/2;
    }
    else if (gameDifficulty == 1){
        numberOfSnakes = length;
    }
    
    for (int i = 0; i < length; i++) {
        int randomBoardLocation = arc4random_uniform(length*length);
        BoardSpace *currentSpace = [gameBoard.boardSpaces objectAtIndex:randomBoardLocation];
        bool isLadderOrSnake = (currentSpace.ladder || currentSpace.snake);
        while (isLadderOrSnake || (randomBoardLocation > (length*length - length - 1))) {
            randomBoardLocation = arc4random_uniform(length*length);
            BoardSpace *currentSpace = [gameBoard.boardSpaces objectAtIndex:randomBoardLocation];
            isLadderOrSnake = (currentSpace.ladder || currentSpace.snake);
        }
        BoardSpace *setCurrentSpace = [gameBoard.boardSpaces objectAtIndex:randomBoardLocation];
        setCurrentSpace.ladder = YES;
        int newRandomBoardLocation = arc4random_uniform(length*length);
        BoardSpace *newSpace = [gameBoard.boardSpaces objectAtIndex:newRandomBoardLocation];
        isLadderOrSnake = (newSpace.ladder || newSpace.snake);
        while (isLadderOrSnake || (newRandomBoardLocation < (randomBoardLocation + length - (randomBoardLocation % length)))) {
            newRandomBoardLocation = arc4random_uniform(length*length);
            BoardSpace *newSpace = [gameBoard.boardSpaces objectAtIndex:newRandomBoardLocation];
            isLadderOrSnake = (newSpace.ladder || newSpace.snake);
        }
        setCurrentSpace.ladderEndLocation = newRandomBoardLocation;
    }
    
    for (int i = 0; i < numberOfSnakes; i++) {
        NSUInteger randomBoardLocation = arc4random_uniform(length*length);
        BoardSpace *currentSpace = [gameBoard.boardSpaces objectAtIndex:randomBoardLocation];
        bool isLadderOrSnake = (currentSpace.ladder || currentSpace.snake);
        while (isLadderOrSnake || (randomBoardLocation < length)) {
            randomBoardLocation = arc4random_uniform(length*length);
            BoardSpace *currentSpace = [gameBoard.boardSpaces objectAtIndex:randomBoardLocation];
            isLadderOrSnake = (currentSpace.ladder || currentSpace.snake);
        }
        BoardSpace *setCurrentSpace = [gameBoard.boardSpaces objectAtIndex:randomBoardLocation];
        setCurrentSpace.snake = YES;
        int newRandomBoardLocation = arc4random_uniform(length*length);
        BoardSpace *newSpace = [gameBoard.boardSpaces objectAtIndex:newRandomBoardLocation];
        isLadderOrSnake = (newSpace.ladder || newSpace.snake);
        while (isLadderOrSnake || (newRandomBoardLocation > (randomBoardLocation - (randomBoardLocation % length)))) {
            newRandomBoardLocation = arc4random_uniform(length*length);
            BoardSpace *newSpace = [gameBoard.boardSpaces objectAtIndex:newRandomBoardLocation];
            isLadderOrSnake = (newSpace.ladder || newSpace.snake);
        }
        setCurrentSpace.snakeEndLocation = newRandomBoardLocation;
    }
}


@end
