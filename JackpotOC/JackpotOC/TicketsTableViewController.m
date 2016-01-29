//
//  TicketsTableViewController.m
//  JackpotOC
//
//  Created by Phillip English on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "TicketsTableViewController.h"
#import "GenerateWinnersViewController.h"
#import "Ticket.h"



@interface TicketsTableViewController ()

@end

@implementation TicketsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrayTickets = [[NSMutableArray alloc] init];
    isSelected = NO;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayTickets.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellNumber" forIndexPath:indexPath];
    
    // Configure the cell...
    
       Ticket *aTicket = (Ticket *)arrayTickets[indexPath.row];
         cell.textLabel.text = [aTicket generateNumbersString];
    cell.detailTextLabel.text = [aTicket getDollarAmount];
    
    cell.textLabel.textColor = [UIColor blackColor];
    
    if ([aTicket getWinningStatus] == YES)
    {
        cell.textLabel.textColor = [UIColor greenColor];
    }
   
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowSegueGenerateWinner"])
    {
        UIViewController *newController = segue.destinationViewController;
        GenerateWinnersViewController *winningTicketVC = (GenerateWinnersViewController *) newController;
        winningTicketVC.delegate = self;
        [winningTicketVC.arrayWinners copy: arrayTickets];
        
    }
}


#pragma mark - Delegate Function Protocol

-(void) numberWasSelected:(NSMutableArray *) ticketArray;
{
    //[arrayTickets copy:ticketArray];
    NSLog(@" this shit is working %@", ticketArray );
}


#pragma mark - Action Handlers
- (IBAction)addTicket:(UIBarButtonItem *)sender
{
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:arrayTickets.count inSection:0];
    [arrayTickets addObject: [Ticket alloc]];
    [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:YES];
    
}

@end
