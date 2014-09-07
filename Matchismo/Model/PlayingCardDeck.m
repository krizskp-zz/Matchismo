//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Shalvindra Prasad on 9/4/14.
//  Copyright (c) 2014 iOS Tutorial. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

- (instancetype)init {
	self = [super init];
	
	if (self) {
		for (NSString *suit in [PlayingCard valid]) {
			<#statements#>
		}
	}
	
	return self;
}

@end
