//
//  TitleDetailViewController.m
//  MovieMania
//
//  Created by Phillip English on 11/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "TitleDetailViewController.h"

@interface TitleDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UILabel *watchLabel;
@property (weak, nonatomic) IBOutlet UILabel *plotLabel;



@end

@implementation TitleDetailViewController
@synthesize segmentedControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *posterURL = [NSURL URLWithString:self.aMovie.posterString];
    NSData *imageData = [NSData dataWithContentsOfURL:posterURL];
    UIImage *image = [UIImage imageWithData:imageData];
    [self ageLoad];
    self.posterImage.image = image;
    // Do any additional setup after loading the view.
    self.plotLabel.text = self.aMovie.summary;
    NSLog(@"This film is rated %@", self.aMovie.rating);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ageSegmentValue:(UISegmentedControl *)sender
{
    Movie *theMovie = self.aMovie;
    if (segmentedControl.selectedSegmentIndex == 0)
    {
        if ([theMovie.rating  isEqual: @"G"] )
        {
            self.watchLabel.text = @"YES";
        }
        
        else
        {
            self.watchLabel.text = @"NO";
        }
        
    }
    
    else if (segmentedControl.selectedSegmentIndex == 1)
    {
        if ([theMovie.rating  isEqual: @"G"] )
        {
            self.watchLabel.text = @"YES";
        }
        
        else if ([theMovie.rating isEqual: @"PG"])
        {
            self.watchLabel.text = @"YES";
        }
        
        else
        {
            self.watchLabel.text = @"NO";
        }
    }
    
    else if (segmentedControl.selectedSegmentIndex == 2)
    {
        if ([theMovie.rating  isEqual: @"G"] )
        {
            self.watchLabel.text = @"YES";
        }
        
        else if ([theMovie.rating isEqual: @"PG"])
        {
            self.watchLabel.text = @"YES";
        }
        
        else if ([theMovie.rating isEqual: @"PG-13"])
        {
            self.watchLabel.text = @"YES";
        }
        
        else
        {
            self.watchLabel.text = @"NO";
        }
    }
    
    else if (segmentedControl.selectedSegmentIndex == 3)
    {
        self.watchLabel.text = @"YES";
    }
}

- (void) ageLoad
{
    Movie *theMovie = self.aMovie;
    if ([theMovie.rating  isEqual: @"G"] )
    {
        self.watchLabel.text = @"YES";
    }
    
    else
    {
        self.watchLabel.text = @"NO";
    }
    

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
