//
//  ViewController.h
//  BlackjackUI
//
//  Created by Zachary Davison on 10/21/14.
//  Copyright (c) 2014 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UILabel *handLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UIButton *drawButton;

@end

