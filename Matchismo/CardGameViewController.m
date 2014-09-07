//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Shalvindra Prasad on 9/4/14.
//  Copyright (c) 2014 iOS Tutorial. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipsCount;
@end

@implementation CardGameViewController

- (void)setFlipsCount:(int)flipsCount{
	_flipsCount = flipsCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipsCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
	if ([sender.currentTitle length]) {
		[sender setBackgroundImage:[UIImage imageNamed:@"card_back"]
						  forState:UIControlStateNormal];
		[sender setTitle:@"" forState:UIControlStateNormal];
	} else {
		[sender setBackgroundImage:[UIImage imageNamed:@"card_front"]
						  forState:UIControlStateNormal];
		[sender setTitle:@"A♣︎" forState:UIControlStateNormal];
	}
	self.flipsCount++;
}


@end
