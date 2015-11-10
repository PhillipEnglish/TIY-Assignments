//
//  TicketsTableViewController.h
//  JackpotOC
//
//  Created by Phillip English on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"


@protocol WinnerTicketDelegateProtocol <NSObject>
-(void) numberWasSelected:(NSMutableArray *) ticketArray;
@end

@interface TicketsTableViewController : UITableViewController
{
    NSMutableArray *arrayTickets;
    BOOL *isSelected;
    
}

@end
