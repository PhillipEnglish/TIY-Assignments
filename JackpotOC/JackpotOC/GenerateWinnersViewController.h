//
//  GenerateWinnersViewController.h
//  JackpotOC
//
//  Created by Phillip English on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketsTableViewController.h"

@interface GenerateWinnersViewController : UIViewController

@property (nonatomic, weak) id <WinnerTicketDelegateProtocol> delegate;

@property (nonatomic) NSMutableArray *arrayWinners;

@end
