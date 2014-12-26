//
//  ResultsCollectionViewController.m
//  
//
//  Created by Mike Choi on 12/22/14.
//
//

#import "ResultsCollectionViewController.h"

@interface ResultsCollectionViewController ()

@end

@implementation ResultsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [_player_scores addObject:[NSNumber numberWithInteger:self.p1_score]];
    [_player_scores addObject:[NSNumber numberWithInteger:self.p2_score]];
    [_player_scores addObject:[NSNumber numberWithInteger:self.p3_score]];
    [_player_scores addObject:[NSNumber numberWithInteger:self.p4_score]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ResultsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"scoreCell" forIndexPath:indexPath];
    
    NSInteger temp = 0;
    if (indexPath.row == 0){
        cell.playerName.text = @"Player 1";
        NSString *p1 = [NSString stringWithFormat:@"SCORE: %li", (long)self.p1_score];
        cell.playerScore.text = p1;
    }
    
    else if (indexPath.row == 1){
        cell.playerName.text = @"Player 2";
        NSString *p2 = [NSString stringWithFormat:@"SCORE: %li", (long)self.p2_score];
        cell.playerScore.text = p2;
    }
    
    for (NSInteger i = 1; i < self.player_scores.count; i++){
        if (self.player_scores[i] > self.player_scores[temp]){
            temp = i;
        }
    }

    
    if(indexPath.row == temp){
        cell.winloss.image = [UIImage imageNamed:@"check"];
    }
    
    
    
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

@end
