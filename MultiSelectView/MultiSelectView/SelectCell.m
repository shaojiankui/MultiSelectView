//
//  SelectCell.m
//  MultiSelectView
//
//  Created by Jakey on 15/3/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "SelectCell.h"

@implementation SelectCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.selectedFlag = NO;
        self.selectedIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview: self.selectedIcon];
        
        self.title = [[UILabel alloc] initWithFrame:CGRectZero];
       // self.title.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview: self.title];

    }
    
    return self;
}

-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        self.selectedIcon.frame = CGRectMake(self.frame.size.width - 15, abs(self.frame.size.height - 15)/ 2, 10, 15);
        self.title.frame = CGRectMake(15, abs(self.frame.size.height - 30)/ 2, self.frame.size.width - 45, 30);
    }
}

- (void)setSelectedFlag:(BOOL)selectedFlag
{
    _selectedFlag = selectedFlag;
    
    [self setNeedsLayout];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    if (self.selectedFlag)
    {
        self.backgroundView.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:230.0/255.0 blue:250.0/255.0 alpha:1.0];
        self.textLabel.textColor = [UIColor darkTextColor];
       //[self.selectedIcon setImage:[UIImage imageNamed:@"icon_selected.png"]];
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        self.backgroundView.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor grayColor];
       // [self.selectedIcon setImage:nil];
       self.accessoryType = UITableViewCellAccessoryNone;
    }
    
    [UIView commitAnimations];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
