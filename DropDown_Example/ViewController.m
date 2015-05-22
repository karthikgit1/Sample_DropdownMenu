//
//  ViewController.m
//  DropDown_Example
//
//  Created by Vy Systems - iOS1 on 5/7/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    // NIDropDown *dropDown;
}
@end

@implementation ViewController
@synthesize dropDown;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCartInfo:) name:@"cartUpdated" object:nil];
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark NsNotification Methods
- (void) updateCartInfo:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"cartUpdated"])
    {
        [self rel];
        
    }
    
}


#pragma mark- IBACTIONS

- (IBAction)btnAction:(id)sender
{
    NSArray * arr ;
    arr = [NSArray arrayWithObjects:@"Hello 0", @"Hello 1", @"Hello 2", @"Hello 3", @"Hello 4", @"Hello 5", @"Hello 6", @"Hello 7", @"Hello 8", @"Hello 9",nil];
    NSArray * arrImage ;
    arrImage = [NSArray arrayWithObjects:[UIImage imageNamed:@"staricon"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"stargold"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], nil];
    if(dropDown == nil)
    {
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc]showDropDown:self.btn1:self.btn1 :&f :arr :arrImage :@"down" :1];
        dropDown.delegate = self;
    }
    else
    {
        [dropDown hideDropDown:sender];
        [self rel];
    }

    //[self rel];
}

- (IBAction)btn2Action:(id)sender
{
    NSArray * arr ;
    arr = [NSArray arrayWithObjects:@"Hello 0", @"Hello 1", @"Hello 2", @"Hello 3", @"Hello 4", @"Hello 5", @"Hello 6", @"Hello 7", @"Hello 8", @"Hello 9",nil];
    NSArray * arrImage ;
    arrImage = [NSArray arrayWithObjects:[UIImage imageNamed:@"staricon"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"stargold"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], nil];
    if(dropDown == nil)
    {
        
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc]showDropDown:self.btn2:self.btn2 :&f :arr :arrImage :@"down" :1];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }

   // [self rel];
}

- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    //    NSLog(@"indexpath is %ld",(long)self.rowIndex);
    //    NSString *_img =[[sharedmethods.COUNTRYLIST objectAtIndex:self.rowIndex] objectForKey:@"code"];
    //
    //    [self.btnFlag setImage:[UIImage imageNamed:_img] forState:UIControlStateNormal];
    //
    //   // self.btnFlag.imageView.contentMode = UIViewContentModeCenter;
    //    // [btnFlag setTitle:c.textLabel.text forState:UIControlStateNormal];
    //
    //    [self.btnCode setTitle:[[sharedmethods.COUNTRYLIST objectAtIndex:self.rowIndex] objectForKey:@"dial_code"] forState:UIControlStateNormal];
    
    [self rel];
}

-(void)rel
{
    //    [dropDown release];
    dropDown = nil;
}
@end
