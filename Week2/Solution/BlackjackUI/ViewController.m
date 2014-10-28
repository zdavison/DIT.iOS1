//
//  ViewController.m
//  BlackjackUI
//
//  Created by Zachary Davison on 10/21/14.
//  Copyright (c) 2014 ZD. All rights reserved.
//

#import "ViewController.h"
#import "BJCard.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *deck;
@property (nonatomic, strong) NSMutableArray *hand;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupHand];
  [self setupDeck];
}

- (void)setupHand{
  _hand = [NSMutableArray array];
}

- (void)setupDeck{
  NSArray *faces = @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
  NSArray *suits = @[@"♣", @"♥", @"♠", @"♦"];
  
  _deck = [NSMutableArray array];
  
  for(NSString *suit in suits){
    for (NSString *face in faces) {
      BJCard *cardInDeck = [[BJCard alloc] initWithSuit:suit face:face];
      [_deck addObject:cardInDeck];
    }
  }
}

- (BJCard*)drawCard{
  NSInteger index = arc4random() % _deck.count;
  BJCard *card = [_deck objectAtIndex:index];
  [_deck removeObject:card];
  
  return card;
}

- (IBAction)drawButtonPressed:(id)sender{
  BJCard *drawnCard = [self drawCard];
  [_hand addObject:drawnCard];
  
  [self updateGame];
}

- (void)updateGame{
  
  NSInteger score = 0;
  NSMutableString *string = [NSMutableString string];
  for(BJCard *card in _hand){
    [string appendFormat:@"%@ ",card];
    score += card.value;
  }
  
  _handLabel.text = string;
  _scoreLabel.text = [NSString stringWithFormat:@"%ld",(long)score];
  
  if((_hand.count >= 5 && score <= 21) || score == 21){
    _statusLabel.text = @"You win!";
  }
  else if(score > 21){
    _statusLabel.text = @"BUST";
  }
  else{
    _statusLabel.text = @"Still good...";
  }
}

@end
