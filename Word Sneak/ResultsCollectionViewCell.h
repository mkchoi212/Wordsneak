//
//  ResultsCollectionViewCell.h
//  Word Sneak
//
//  Created by Mike Choi on 12/22/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *playerName;
@property (weak, nonatomic) IBOutlet UILabel *playerScore;
@property (weak, nonatomic) IBOutlet UIImageView *winloss;

@end
