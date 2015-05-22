//
//  ViewController.h
//  DropDown_Example
//
//  Created by Vy Systems - iOS1 on 5/7/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"
@interface ViewController : UIViewController<NIDropDownDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@property (weak, nonatomic) NIDropDown *dropDown;

- (IBAction)btnAction:(id)sender;

- (IBAction)btn2Action:(id)sender;

-(void)rel;
@end

