//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Shalvindra Prasad on 9/4/14.
//  Copyright (c) 2014 iOS Tutorial. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSegment;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game {
	if(!_game) {
		_game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
												  usingDeck:[self createDeck]];
	}
	return _game;
}

- (Deck *)createDeck {
	return [[PlayingCardDeck alloc] init];
}

- (int)matchMode {
	if ([self.modeSegment selectedSegmentIndex] == 0) {
		return TWO_CARDS_MATCH;
	} else if ([self.modeSegment selectedSegmentIndex] == 1) {
		return THREE_CARDS_MATCH;
	}
	return TWO_CARDS_MATCH;
}

- (IBAction)touchCardButton:(UIButton *)sender {
	int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
	[self.game chooseCardAtIndex:chosenButtonIndex];
	[self updateUI];
}

- (IBAction)touchDeal:(UIButton *)sender {
	self.game = nil;
	[self game];
	[self updateUI];
}

- (void)updateUI {
	for (UIButton *cardButton in self.cardButtons) {
		int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
		Card *card = [self.game cardAtIndex:cardButtonIndex];
		[cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
		[cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
		cardButton.enabled = !card.isMatched;
		self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
	}
}

- (NSString *)titleForCard:(Card *)card {
	return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
	return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

static const int TWO_CARDS_MATCH = 2;
static const int THREE_CARDS_MATCH = 3;

@end
