//
//  ViewController.m
//  Word Sneak
//
//  Created by Mike Choi on 12/12/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import <AVFoundation/AVFoundation.h>
#import "YQLoginCardView.h"
#import "PlayViewController.h"
#import "correctView.h"
#import "ResultsViewController.h"

@interface PlayViewController (){
    UIView *leftView;
    UIView *rightView;
    CGFloat divisionX;
    NSInteger numberPressed;
    NSInteger countTemp;
}

@end

@implementation PlayViewController
    AVAudioPlayer *correctAudio;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.da_button.hidden = TRUE;
    self.fail_button.hidden = TRUE;
    self.quitButton.hidden = TRUE;
    self.circleCounter.hidden = TRUE;
    self.circleCounter.delegate = self;
    self.circleCounter.circleColor = [UIColor colorWithRed:141.0/255.0 green:25.0/255.0 blue:2.0/255.0 alpha:1];

    self.player_name.text = @"PLAYER 1";
    self.intro1.text = @"READY?";
    self.intro2.text = @"(Touch Screen To Start)";

    
    word_list = [[NSMutableArray alloc]initWithObjects:@"Baddonkadonk",
                 @"Grape Nuts", @"Pulp Fiction", @"Loofah", @"Floss", @"Female Bodybuilder", @"Oompa Loompa", @"Corn", @"Calamari", @"Moose", @"Zucchini", @"Pantaloons", @"Friend-zone", @"Kumquat", @"Pelvis", @"Couscous", @"Chicken Gordon Blue", @"Taco Tuesday", @"Taco Bell", @"Bill Cosby", @"Mexican Pizza", @"Toothbrush", @"Jonah Hill", @"Protein Shake", @"Ohio", @"Bunny Suit", @"Quinoa", @"Hyperbole", @"Britney Spears", @"Forehand Backhand", @"Sherlock", nil];
    
    naughty_list = [[NSMutableArray alloc]initWithObjects: @"Anal Beads", @"Reverse Cowgirl", @"AIDS", @"Ghonoeria", @"Dildo", @"Hairy Penis", @"Cunt", @"Edible Sex Toys", @"Climax", @"Pubes", @"Jizz", @"Douche", @"Curved Penis", @"Condom", @"Water Soluble Lube", @"Spermicidal Lube", @"AIDS", @"STD", @"Banana Dick", @"Motorboat", @"Rape", @"Strap-on", @"Flavored Condoms", @"Glow in the Dark", @"Condoms", @"Pussy Monster", @"Crusty", @"Dirty Sanchez", @"Motherfucker", @"Flavored Condoms", nil];
    
    if (self.category == 0 ){
       da_list = [NSMutableArray arrayWithArray:word_list];
    }
    else if(self.category == 1){
        da_list = [NSMutableArray arrayWithArray:naughty_list];

    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger playanum = [defaults integerForKey:@"playa"];
    self.playerNumber = playanum;
}

- (IBAction)correctButton:(id)sender {
    ++numberPressed;
    NSURL *musicFile;
    musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"correct" ofType:@"wav"]];
    correctAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
     [correctAudio play];


    if(da_list.count!=0) { [self correctomundo]; }

    else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ResultsViewController *results = [storyboard instantiateViewControllerWithIdentifier:@"results"];
        results.p1_score = playerScores[0];
        results.p2_score = playerScores[1];
        results.p3_score = playerScores[2];
        results.p4_score = playerScores[3];
        
        [self presentViewController:results animated:YES completion:nil];
    }
}

- (IBAction)wrongButton:(id)sender {
       ++numberPressed;
    NSURL *musicFile;
    musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"wrong" ofType:@"wav"]];
    correctAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
    [correctAudio play];


    if(da_list.count!=0) { [self wrongNumba]; }
    //THE RESULT PAGE
    else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ResultsViewController *results = [storyboard instantiateViewControllerWithIdentifier:@"results"];
        results.p1_score = playerScores[0];
        results.p2_score = playerScores[1];
        results.p3_score = playerScores[2];
        results.p4_score = playerScores[3];
        [self.navigationController pushViewController:results animated:YES];
    }
}



#pragma mark DETECT SHAKE TO SKIP

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(!self.quitButton.hidden){
        if (motion == UIEventSubtypeMotionShake) {
            [self skip_bitch];
        }
    }
}

- (void)correctomundo{
    YQLoginCardView *loginCardView = [[YQLoginCardView alloc] init];
    correctView *theView = [[[NSBundle mainBundle] loadNibNamed:@"correctView" owner:self options:nil] objectAtIndex:0];
        theView.headline.text = @"CORRECT";
    
    switch (self.playerNumber){
        case 0:
            theView.playerComment.text = @"You, again";
            playerScores[0]+=100;
            numberPressed = 0;
            break;
            
        case 1:
            if (numberPressed % 2 == 0){
                theView.playerComment.text = @"Player 1's Turn";
                playerScores[1]+=100;
            }
            else {
                theView.playerComment.text = @"Player 2's Turn";
                playerScores[0]+=100;
            }
            break;
            
        case 2:
            if (numberPressed == 3){
                theView.playerComment.text = @"Player 1's Turn";
                playerScores[2]+=100;
                numberPressed = 0;
            }
            else{
                NSInteger temp = numberPressed+1;
                NSString *thecomment = [NSString stringWithFormat: @"Player %ld's Turn", (long)temp];
                theView.playerComment.text = thecomment;
                playerScores[numberPressed-1]+=100;
            }
            break;
            
        case 3:
            if (numberPressed == 4){
                theView.playerComment.text = @"Player 1's Turn";
                playerScores[3]+=100;
                numberPressed = 0;
            }
            else{
                NSInteger temp = numberPressed+1;
                NSString *thecomment = [NSString stringWithFormat: @"Player %ld's Turn", (long)temp];
                theView.playerComment.text = thecomment;
                playerScores[numberPressed-1]+=100;
            }
            break;
            
        default:
            break;
    }
    
    [loginCardView addSubview:theView];
    [loginCardView showView];
    [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(nextWord:) userInfo:nil repeats:NO];

}
- (void)wrongNumba{
    YQLoginCardView *loginCardView = [[YQLoginCardView alloc] init];
    correctView *theView = [[[NSBundle mainBundle] loadNibNamed:@"correctView" owner:self options:nil] objectAtIndex:0];
    theView.headline.text = @"CAUGHT!";
    theView.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:23.0/255.0 blue:29.0/255.0 alpha:1];

    switch (self.playerNumber){
        case 0:
            theView.playerComment.text = @"You, again";
            playerScores[0]-=50;
            numberPressed = 0;
            break;
            
        case 1:
            if (numberPressed % 2 == 0){
                theView.playerComment.text = @"Player 1's Turn";
                playerScores[1]-=50;
            }
            else {
                theView.playerComment.text = @"Player 2's Turn";
                playerScores[0]-=50;
            }
            break;
            
        case 2:
            if (numberPressed == 3){
                theView.playerComment.text = @"Player 1's Turn";
                playerScores[2]-=50;
                numberPressed = 0;
            }
            else{
                NSInteger temp = numberPressed+1;
                NSString *thecomment = [NSString stringWithFormat: @"Player %ld's Turn", (long)temp];
                theView.playerComment.text = thecomment;
                playerScores[temp-1]-=50;
            }
            break;
            
        case 3:
            if (numberPressed == 4){
                theView.playerComment.text = @"Player 1's Turn";
                playerScores[3]-=50;
                numberPressed = 0;
            }
            else{
                NSInteger temp = numberPressed+1;
                NSString *thecomment = [NSString stringWithFormat: @"Player %ld's Turn", (long)temp];
                theView.playerComment.text = thecomment;
                playerScores[temp-1]-=50;
            }
            break;
            
        default:
            break;

    }

    
    [loginCardView addSubview:theView];
    [loginCardView showView];
    
    [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(nextWord:) userInfo:nil repeats:NO];
}


- (void)skip_bitch {
    self.view.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:23.0/255.0 blue:29.0/255.0 alpha:1];

    self.da_word.text= @"Skipped";
    CABasicAnimation *animation =
    [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([self.view center].x - 30.0f, [self.view center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([self.view center].x + 30.0f, [self.view center].y)]];
    [[self.view layer] addAnimation:animation forKey:@"position"];
    [NSTimer scheduledTimerWithTimeInterval:.8 target:self selector:@selector(nextWord:) userInfo:nil repeats:NO];
    NSURL *musicFile;
    musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"skip" ofType:@"wav"]];
    correctAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
    [correctAudio play];


}

- (void)nextWord:(id)sender{
    self.view.backgroundColor = [UIColor colorWithRed:27.0/255.0 green:125.0/255.0 blue:191.0/255.0 alpha:1];
    
    NSUInteger randomIndex = arc4random() % [da_list count];
    self.da_word.text = [da_list objectAtIndex:randomIndex];
    [da_list removeObjectAtIndex: randomIndex];
    
    
}


#pragma mark TIMER & BEGINNING
- (void) timerRun {
    secondCount = secondCount-1;
    int minutes = secondCount / 60;
    int seconds = secondCount - (minutes * 60);
    
    NSString *timerOutput = [NSString stringWithFormat:@"%.1d", seconds];
    self.timer_label.text = timerOutput;
    if(secondCount == 0){
        [countdownTimer invalidate];
        [self.timer_label removeFromSuperview];
        
        NSURL *musicFile;
        musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"go" ofType:@"wav"]];
        correctAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
        [correctAudio play];

        //ADD HIDDEN SCREEN
        [self.view addSubview:leftView];
        [self.view addSubview:rightView];
        self.da_button.hidden = FALSE;
        self.fail_button.hidden = FALSE;
        self.quitButton.hidden = FALSE;
        self.circleCounter.hidden = FALSE;
        
        //ASSIGN WORD HERE!!!!
        NSUInteger randomIndex = arc4random() % [da_list count];
        self.da_word.text = [da_list objectAtIndex:randomIndex];
        [da_list removeObjectAtIndex: randomIndex];
        self.intro_tap.enabled = NO;
        countdownTimer = nil;
        
        //CIRCLE COUNTER
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSInteger savedTime = [defaults integerForKey:@"time"];
        if (savedTime == 0){
            savedTime = 2;
        }
        
        [self.circleCounter startWithSeconds:savedTime*60];
        
    }
}

- (void) setTimer{
    secondCount = 5;
    countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
}

- (IBAction)tap_start:(id)sender {

    [self.intro1 removeFromSuperview];
    [self.intro2 removeFromSuperview];
    [self.player_name removeFromSuperview];
    NSURL *musicFile;
    musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"ready" ofType:@"wav"]];
    correctAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
    if(countTemp == 0){
    [self setTimer];

    }
    countTemp++;
        [correctAudio play];
}

- (IBAction)quit:(id)sender {
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ResultsViewController *results = [storyboard instantiateViewControllerWithIdentifier:@"results"];
    results.p1_score = playerScores[0];
    results.p2_score = playerScores[1];
    results.p3_score = playerScores[2];
    results.p4_score = playerScores[3];
    [self.navigationController presentViewController:results animated:YES completion:nil];
  
}

- (void)circleCounterTimeDidExpire:(JWGCircleCounter *)circleCounter {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ResultsViewController *results = [storyboard instantiateViewControllerWithIdentifier:@"results"];
    results.p1_score = playerScores[0];
    results.p2_score = playerScores[1];
    results.p3_score = playerScores[2];
    results.p4_score = playerScores[3];
    [self.navigationController presentViewController:results animated:YES completion:nil];
}


#pragma mark iAD Delegate Methods

- (void)bannerViewDidLoadAd:(ADBannerView *)banner{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
}

@end
