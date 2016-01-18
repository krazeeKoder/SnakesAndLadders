//
//  main.m
//  SnakesAndLadders
//
//  Created by Anthony Tulai on 2016-01-17.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"
#import "GenerateBoard.h"
#import "Player.h"
#import "PlayerTurn.h"
#import "BoardSpace.h"


int main(int argc, const char * argv[]) {
    
    
    NSLog(@"Welcome to Snakes and Ladders!! To begin enter a boardSize: ");
    char playerBoardsizeInput[10];
    fgets(playerBoardsizeInput, 10, stdin);
    NSString *boardSizeText = [NSString stringWithUTF8String:playerBoardsizeInput];
    boardSizeText = [boardSizeText stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    int boardSize = [boardSizeText intValue];

    PlayerTurn *currentPlayerTurn = [[PlayerTurn alloc]init];
    bool gameRunning = true;
    Board *gameBoard = [[Board alloc] init];
    for (int i = 0; i<boardSize*boardSize; i++){
        [gameBoard.boardSpaces addObject:[[BoardSpace alloc]init]];
    }

    [gameBoard addSnakesAndLaddersForGameDifficulty:2 Board:gameBoard ofLength:boardSize];
    
    
    Player *player1 = [[Player alloc] init];
    Player *player2 = [[Player alloc] init];
    Player *currentPlayer = [[Player alloc] init];
    Player *currentOpponent = [[Player alloc]init];
    
    player1.name = @"Player 1";
    player1.isTurn = YES;
    player2.name = @"Player 2";
    
    while (gameRunning) {
        

        if (player1.isTurn) {
            currentPlayer = player1;
            currentOpponent = player2;
        }
        else {
            currentPlayer = player2;
            currentOpponent = player1;
        }
        
        [currentPlayerTurn PlayerTurn:currentPlayer onBoard:gameBoard againstPlayer:currentOpponent];
        
        if (currentPlayer.wonTheGame) {
            NSLog(@"@Conratulations! Player %@ Won the game!!!", currentPlayer.name);
        }

    }
    
    return 0;
}
