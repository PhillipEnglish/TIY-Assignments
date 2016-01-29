//
//  Ticket.m
//  JackpotOC
//
//  Created by Phillip English on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

- (id)init
{
    self = [super init];
    if (self)
    {
        self.winningStatus = NO;
        self.arrayNumbers = [[NSMutableArray alloc]init];
        self.dollarAmount = 0;
        [self generateNumbers];
        
    }
    return self;
}

-(void) generateNumbers
{
    
    
    while (self.arrayNumbers.count <6)
    {
        NSNumber *pick;
        do
        {
            pick = [NSNumber numberWithInt: arc4random_uniform(53)+1];
        }
        while ([self.arrayNumbers containsObject: pick]);
        
        [self.arrayNumbers addObject:pick];
        
    }
}


-(NSString *) generateNumbersString
{
    NSString *string = [self.arrayNumbers componentsJoinedByString:@", "];
    
    return string;
}


-(void) setWinningStatus
{
    self.winningStatus = !self.winningStatus;
    
}

-(BOOL) getWinningStatus
{
    return self.winningStatus;
}

-(NSMutableArray *) getArrayNumbers
{
    return self.arrayNumbers;
}

-(void) setDollarAmount:(int)dollarAmount
{
    self.dollarAmount = dollarAmount;
}

-(NSString *) getDollarAmount
{
    
    return [NSString stringWithFormat: @"%d", self.dollarAmount];
}

@end
