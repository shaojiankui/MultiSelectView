//
//  SelectCell.h
//  MultiSelectView
//
//  Created by Jakey on 15/3/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectCell : UITableViewCell
@property (assign,nonatomic) BOOL selectedFlag;
@property (strong,nonatomic) UIImageView *selectedIcon;
@property (strong,nonatomic) UILabel *title;

@end
