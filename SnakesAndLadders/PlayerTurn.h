//
//  PlayerTurn.h
//  SnakesAndLadders
//
//  Created by Anthony Tulai on 2016-01-17.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;
@class Board;

@interface PlayerTurn : NSObject

-(void)PlayerTurn:(Player *)currentPlayer onBoard:(Board *)gameBoard againstPlayer:(Player *)opponent;

@end
