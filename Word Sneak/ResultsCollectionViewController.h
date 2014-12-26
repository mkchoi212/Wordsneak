//
//  ResultsCollectionViewController.h
//  
//
//  Created by Mike Choi on 12/22/14.
//
//

#import <UIKit/UIKit.h>
#import "ResultsCollectionViewCell.h"

@interface ResultsCollectionViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic) NSInteger p1_score;
@property (nonatomic) NSInteger p2_score;
@property (nonatomic) NSInteger p3_score;
@property (nonatomic) NSInteger p4_score;
@property (nonatomic) NSMutableArray *player_scores;
@end
