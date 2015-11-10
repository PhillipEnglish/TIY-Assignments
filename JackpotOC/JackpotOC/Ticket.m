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
        winningStatus = NO;
        arrayNumbers = [[NSMutableArray alloc]init];
        dollarAmount = 0;
        
    }
    return self;
}

-(void) generateNumbers
{
    
    
    while (arrayNumbers.count <6)
    {
        NSNumber *pick;
        do
        {
            pick = [NSNumber numberWithInt: arc4random_uniform(53)+1];
        }
        while ([arrayNumbers containsObject: pick]);
        
        [arrayNumbers addObject:pick];
        
    }
}


-(NSString *) generateNumbersString
{
    NSString *string = [arrayNumbers componentsJoinedByString:@", "];
    
    return string;
}


-(void) setWinningStatus
{
    winningStatus = !winningStatus;
    
}

@end
