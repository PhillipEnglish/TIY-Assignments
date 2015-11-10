//
//  GenerateWinnersViewController.m
//  JackpotOC
//
//  Created by Phillip English on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "GenerateWinnersViewController.h"

@interface GenerateWinnersViewController ()
<UIPickerViewDataSource,UIPickerViewDelegate>

{
    NSMutableArray *arrayWinners;
    
}
@property (weak, nonatomic) IBOutlet UIPickerView *ticketPicker;


@end

@implementation GenerateWinnersViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrayWinners = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker Functions
-(int) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 6;
}

-(int) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 53;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%d", row+1];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
