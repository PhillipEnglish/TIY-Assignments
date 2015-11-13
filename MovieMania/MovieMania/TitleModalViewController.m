//
//  TitleViewController.m
//  MovieMania
//
//  Created by Phillip English on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "TitleModalViewController.h"

@interface TitleModalViewController () <NSURLSessionDataDelegate, UITextFieldDelegate>
{
    UITextField *titleTextField;
//@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
}
- (IBAction)cancelButton:(UIBarButtonItem *)sender;

-(IBAction)searchTitleButton:(UIButton *)sender;

@end

@implementation TitleModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Handlers

- (IBAction)cancelButton:(UIBarButtonItem *)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)searchTitleButton:(UIButton *)sender
{
    NSString *title = titleTextField.text;
     NSString *formattedTitle = [title stringByReplacingOccurrencesOfString:@" " withString:@"+"];
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
