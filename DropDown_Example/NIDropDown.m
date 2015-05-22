//
//  NIDropDown.m
//  NIDropDown
//
//  Created by Bijesh N on 12/28/12.
//  Copyright (c) 2012 Nitor Infotech. All rights reserved.
//

#import "NIDropDown.h"
#import "QuartzCore/QuartzCore.h"
#import "ViewController.h"
@interface NIDropDown ()
@property(nonatomic, strong) UITableView *table;
@property(nonatomic, strong) UIButton *btnFlag;
@property(nonatomic, retain) NSArray *list;
@property(nonatomic, retain) NSArray *imageList;

@property(nonatomic, strong) UIButton *btnCode;
@end

@implementation NIDropDown
@synthesize table;
@synthesize btnFlag,btnCode;
@synthesize list;
@synthesize imageList;
@synthesize delegate;
@synthesize animationDirection;

- (id)showDropDown:(UIButton *)b :(UIButton *)b2 :(CGFloat *)height :(NSArray *)arr :(NSArray *)imgArr :(NSString *)direction :(NSInteger)_rowindex
{
    btnFlag = b; btnCode = b2;
    animationDirection = direction;
    self.table = (UITableView *)[super init];
    
   // sharedmethods = [CommonMethods sharedManager];
    
    if (self)
    {
        // Initialization code
        CGRect btn = CGRectMake(b.frame.origin.x, b.frame.origin.y-170, 230, 200);
        self.list = [NSArray arrayWithArray:arr];
        self.imageList = [NSArray arrayWithArray:imgArr];
        if ([direction isEqualToString:@"up"])
        {
            self.frame = CGRectMake(b.frame.origin.x, b.frame.origin.y, 230, 200);
            self.layer.shadowOffset = CGSizeMake(-5, -5);
        }
        else if ([direction isEqualToString:@"down"])
        {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-5, 5);
        }
        
//        self.layer.masksToBounds = NO;
//        self.layer.cornerRadius = 8;
//        self.layer.shadowRadius = 5;
//        self.layer.shadowOpacity = 0.5;
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, btn.size.width, 0)];
        table.delegate = self;
        table.dataSource = self;
        table.layer.cornerRadius = 5;
       // table.backgroundColor = [UIColor colorWithRed:0.239 green:0.239 blue:0.239 alpha:1];
        table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        table.separatorColor = [UIColor grayColor];
        
        if ([table respondsToSelector:@selector(setSeparatorInset:)])
        {
            [table setSeparatorInset:UIEdgeInsetsZero];
        }
        
        if ([table respondsToSelector:@selector(setLayoutMargins:)])
        {
            [table setLayoutMargins:UIEdgeInsetsZero];
        }
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        if ([direction isEqualToString:@"up"])
        {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y-*height, btn.size.width, *height);
        }
        else if([direction isEqualToString:@"down"])
        {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, *height);
        }
        table.frame = CGRectMake(0, 0, btn.size.width, *height);
        [UIView commitAnimations];
        [b.superview addSubview:self];
        [self addSubview:table];
        
        //************SCROLL TO PARTICULAR ROW************
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_rowindex inSection:0];
        [table scrollToRowAtIndexPath:indexPath
                             atScrollPosition:UITableViewScrollPositionTop
                                     animated:YES];
    }
    return self;
}

-(void)hideDropDown:(UIButton *)b {
    CGRect btn = b.frame;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    if ([animationDirection isEqualToString:@"up"]) {
        self.frame = CGRectMake(btn.origin.x, btn.origin.y, btn.size.width, 0);
    }else if ([animationDirection isEqualToString:@"down"]) {
        self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, 0);
    }
    table.frame = CGRectMake(0, 0, btn.size.width, 0);
    [UIView commitAnimations];
    
//    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ViewController * vc = [storyBoard instantiateViewControllerWithIdentifier:@"ViewController"];
//    
//    [vc rel];
    
     [[NSNotificationCenter defaultCenter] postNotificationName:@"cartUpdated" object:self];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textColor = [UIColor blackColor];
        //cell.textLabel.textAlignment = UITextAlignmentCenter;
    }
    
    cell.textLabel.text =[NSString stringWithFormat:@"row %ld",indexPath.row];
    
   // NSString *_img =[[[sharedmethods.COUNTRYLIST objectAtIndex:indexPath.row] objectForKey:@"code"] lowercaseString];
    
   // cell.imageView.image = [UIImage imageNamed:_img];

    
//    if ([self.imageList count] == [self.list count])
//    {
//        cell.textLabel.text =[list objectAtIndex:indexPath.row];
//        cell.imageView.image = [imageList objectAtIndex:indexPath.row];
//    }
//    else if ([self.imageList count] > [self.list count])
//    {
//        cell.textLabel.text =[list objectAtIndex:indexPath.row];
//        if (indexPath.row < [imageList count])
//        {
//            cell.imageView.image = [imageList objectAtIndex:indexPath.row];
//        }
//    }
//    else if ([self.imageList count] < [self.list count])
//    {
//        cell.textLabel.text =[list objectAtIndex:indexPath.row];
//        if (indexPath.row < [imageList count])
//        {
//            cell.imageView.image = [imageList objectAtIndex:indexPath.row];
//        }
//    }
    
//    cell.textLabel.text =[sharedmethods.COUNTRYLIST objectAtIndex:indexPath.row];
//    cell.imageView.image = [imageList objectAtIndex:indexPath.row];
    
    //cell.textLabel.textColor = [UIColor whiteColor];
    
    UIView * v = [[UIView alloc] init];
    v.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = v;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexpath is %ld",(long)indexPath.row);
   
    [[NSNotificationCenter defaultCenter] postNotificationName: @"COUNTRYINDEX" object: [NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    
    [self hideDropDown:btnFlag];
    
    UITableViewCell *c = [tableView cellForRowAtIndexPath:indexPath];
    
    // NSString *_img =[[[sharedmethods.COUNTRYLIST objectAtIndex:indexPath.row] objectForKey:@"code"] lowercaseString];
    
   // [btnFlag setImage:[UIImage imageNamed:_img] forState:UIControlStateNormal];

    btnFlag.imageView.contentMode = UIViewContentModeCenter;
    [btnFlag setTitle:c.textLabel.text forState:UIControlStateNormal];
    
   // [btnCode setTitle:[[sharedmethods.COUNTRYLIST objectAtIndex:indexPath.row] objectForKey:@"dial_code"] forState:UIControlStateNormal];
    
    
//    for (UIView *subview in btnFlag.subviews)
//    {
//        if ([subview isKindOfClass:[UIImageView class]])
//        {
//            [subview removeFromSuperview];
//        }
//    }
//    
//    imgView.image = c.imageView.image;
//    imgView = [[UIImageView alloc] initWithImage:c.imageView.image];
//    //imgView.frame = CGRectMake(5, 5, 25, 25);
//    imgView.contentMode = UIViewContentModeCenter;
//    [btnFlag addSubview:imgView];
//    [self myDelegate];
}

- (void) myDelegate
{
    [self.delegate niDropDownDelegateMethod:self];
}

-(void)dealloc {
//    [super dealloc];
//    [table release];
//    [self release];
}

@end
