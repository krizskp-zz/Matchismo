//
//  PlayingCard.h
//  Matchismo
//
//  Created by Shalvindra Prasad on 9/4/14.
//  Copyright (c) 2014 iOS Tutorial. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
