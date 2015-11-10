//
//  GenerateWinnersViewController.h
//  JackpotOC
//
//  Created by Phillip English on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GenerateWinnersViewController : UIViewController

@property (nonatomic, weak) id <WinnerTicketDelegateProtocol> delegate;

@end
