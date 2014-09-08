//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Shalvindra Prasad on 9/4/14.
//  Copyright (c) 2014 iOS Tutorial. All rights reserved.
//

#import "CardGameViewController.h"
#import "Model/PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipsCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController

- (Deck *)deck {
	if(!_deck) {
		_deck = [[PlayingCardDeck alloc] init];
	}
	
	return _deck;
}

- (void)setFlipsCount:(int)flipsCount{
	_flipsCount = flipsCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipsCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
	if ([sender.currentTitle length]) {
		[sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
						  forState:UIControlStateNormal];
		[sender setTitle:@"" forState:UIControlStateNormal];
	} else {
		Card *card = [self.deck drawRandomCard];
		if(card) {
			[sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
							  forState:UIControlStateNormal];
			[sender setTitle:[card contents] forState:UIControlStateNormal];
		}
	}
	self.flipsCount++;
}


@end
