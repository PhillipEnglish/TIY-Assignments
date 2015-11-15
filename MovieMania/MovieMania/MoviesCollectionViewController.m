//
//  MoviesCollectionViewController.m
//  MovieMania
//
//  Created by Phillip English on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "MoviesCollectionViewController.h"
#import "TitleModalViewController.h"
#import "TitleCell.h"
#import "Movie.h"

@interface MoviesCollectionViewController ()
{
    NSMutableArray *titles;
}

@end

@implementation MoviesCollectionViewController

static NSString * const reuseIdentifier = @"TitleCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor redColor];
    titles = [[NSMutableArray alloc] init];
//    [titles addObject:@"testing"];
//    [titles addObject:@"one"];
//    [titles addObject:@"two"];
//    [titles addObject:@"three"];
    NSLog(@"%@", titles);
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"TitleCell"];
    
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   // [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PresentModalTitleVCSegue"]) //PresentModalTitleVCSegue
    {
        TitleModalViewController *newTitleVC = [segue destinationViewController];    //(TitleModalViewController *)segue.destinationViewController;
      //UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:newTitleVC];
        //newTitleVC.delegate = self;
        newTitleVC.titles = titles;
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TitleCell" forIndexPath:indexPath];
    
    // Configure the cell
    
//   NSDictionary *aTitle =  titles[indexPath.row];
//     NSURL *posterURL = [NSURL URLWithString:aTitle[@"Poster"]];
//   NSData *imageData = [NSData dataWithContentsOfURL:posterURL];
//   UIImage *image = [UIImage imageWithData:imageData];
//    cell.movieImage.image = image;
    
    Movie *aMovie = titles[indexPath.row];
    
    cell.movieLabel.text = aMovie.title;
    
    NSURL *posterURL = [NSURL URLWithString:aMovie.posterString];
    NSData *imageData = [NSData dataWithContentsOfURL:posterURL];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.movieImage.image = image;
    
    [cell.layer setBorderWidth:2.0f];
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark - delegate
-(void)movieWasSearched:(NSDictionary *)chosenMovie;
{
   // NSLog(@"%@", chosenMovie);
    [titles addObject:chosenMovie];
    NSLog(@"this is a string");
    NSLog(@"Here's the dictionary: %@", chosenMovie);
    
}

@end
