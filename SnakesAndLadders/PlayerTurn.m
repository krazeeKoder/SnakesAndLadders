//
//  PlayerTurn.m
//  SnakesAndLadders
//
//  Created by Anthony Tulai on 2016-01-17.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "PlayerTurn.h"
#import "BoardSpace.h"
#import "Board.h"
#import "Player.h"

@implementation PlayerTurn

-(void)PlayerTurn:(Player *)currentPlayer onBoard:(Board *)gameBoard againstPlayer:(Player *)opponent {
    
    NSUInteger boardSize = [gameBoard.boardSpaces count];
    NSLog(@"%@ please enter your dice roll value: ", currentPlayer.name);
    char playerInputDiceRoll[10];
    fgets(playerInputDiceRoll, 10, stdin);
    NSString *diceRollText = [NSString stringWithUTF8String:playerInputDiceRoll];
    diceRollText = [diceRollText stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    int diceRoll = [diceRollText intValue];
    
    currentPlayer.location = currentPlayer.location + diceRoll;
    
    if (currentPlayer.location > boardSize) {
        currentPlayer.wonTheGame = YES;
    } else {
        
        BoardSpace *currentPlayerSpace = [gameBoard.boardSpaces objectAtIndex:currentPlayer.location];
        
        if (currentPlayerSpace.ladder) {
            currentPlayer.location = currentPlayerSpace.ladderEndLocation;
            NSLog(@"You hit a ladder and jumped ahead to space %d on the gameBoard.", currentPlayer.location + 1);
        } else if (currentPlayerSpace.snake) {
            currentPlayer.location = currentPlayerSpace.snakeEndLocation;
            NSLog(@"You hit a snake and moved back to space %d on the gameBoard.", currentPlayer.location + 1);
        }
        
        NSLog(@"%@ your current location is %d on a board of size %lu", currentPlayer.name, currentPlayer.location + 1, boardSize);
        
        currentPlayer.isTurn = NO;
        opponent.isTurn = YES;
    }
    
    
    
    
}

@end
