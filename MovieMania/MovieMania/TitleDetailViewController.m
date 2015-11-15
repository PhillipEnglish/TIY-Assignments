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

@end

@implementation TitleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *posterURL = [NSURL URLWithString:self.aMovie.posterString];
    NSData *imageData = [NSData dataWithContentsOfURL:posterURL];
    UIImage *image = [UIImage imageWithData:imageData];
    self.posterImage.image = image;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
