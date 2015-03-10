//
//  MultiSelectView.h
//  MultiSelectView
//
//  Created by Jakey on 15/3/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectCell.h"
typedef id (^OnSelectBlock)(id item,NSInteger index);
typedef NSString* (^TitleBlock)(id item);
typedef BOOL (^FlagBlock)(id item);


@interface MultiSelectView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_listView;
    OnSelectBlock _onSelectBlock;
    TitleBlock _titleBlock;
    FlagBlock _flagBlock;
    
}
@property (nonatomic,strong) NSMutableArray *items;
@property (nonatomic,strong) UIColor *titleColor;

-(void)setOnSelectBlock:(OnSelectBlock)onSelectBlock;
-(void)setTitleBlock:(TitleBlock)titleBlock;
-(void)setFlagBlock:(FlagBlock)flagBlock;


@end
