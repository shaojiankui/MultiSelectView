//
//  MultiSelectView.m
//  MultiSelectView
//
//  Created by Jakey on 15/3/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "MultiSelectView.h"

@implementation MultiSelectView

-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        _listView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        _listView.delegate = self;
        _listView.dataSource = self;
        [self addSubview:_listView];
    }
}
-(void)setItems:(NSMutableArray *)items{
    _items = items;
    [_listView reloadData];
}
-(void)setOnSelectBlock:(OnSelectBlock)onSelectBlock{
    _onSelectBlock = [onSelectBlock copy];
}
-(void)setTitleBlock:(TitleBlock)titleBlock{
    _titleBlock = [titleBlock copy];
}
-(void)setFlagBlock:(FlagBlock)flagBlock{
    _flagBlock = [flagBlock copy];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"SelectCell";

    [_listView registerClass:[SelectCell class] forCellReuseIdentifier:CellIdentifier];
    SelectCell *cell = (SelectCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    //SelectCell *cell = [[SelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.tintColor = [UIColor grayColor];
    cell.title.textColor = self.titleColor?:[UIColor blackColor];

    //config the cell
    if (_titleBlock) {
        cell.title.text = _titleBlock(self.items[indexPath.row]);
    }
    if (_flagBlock) {
        cell.selectedFlag = _flagBlock(self.items[indexPath.row]);
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectCell *cell = (SelectCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    if (_onSelectBlock) {
         _items[indexPath.row] = _onSelectBlock(self.items[indexPath.row],indexPath.row);
    }
    cell.selectedFlag =!cell.selectedFlag;

}
@end
