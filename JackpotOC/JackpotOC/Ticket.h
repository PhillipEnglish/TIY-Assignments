//
//  Ticket.h
//  JackpotOC
//
//  Created by Phillip English on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject



    

@property(nonatomic) NSMutableArray *arrayNumbers;
@property(nonatomic) BOOL winningStatus;
@property(nonatomic) int dollarAmount;


-(NSString *) generateNumbersString;

-(void) generateNumbers;

-(void) setWinningStatus;

-(NSString *) getDollarAmount;

-(void) setDollarAmount:(int)dollarAmount;

-(NSMutableArray *) getArrayNumbers;

-(BOOL) getWinningStatus;






@end
