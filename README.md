# MultiSelectView
IOS基于tableview的多选控件封装,block回调

##使用方法
 	NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i++)
    {
        [array addObject:@{@"flag":[NSNumber numberWithBool:NO],@"title":[NSString stringWithFormat:@"%d",i]}];

    }
    
	self.multiSelect.items  = array;
    [self.multiSelect setTitleBlock:^NSString *(id item) {
        return [item objectForKey:@"title"];
    }];

    [self.multiSelect setFlagBlock:^BOOL (id item) {
        return [[item objectForKey:@"flag"] boolValue];
    }];
    [self.multiSelect setOnSelectBlock:^id (id item, NSInteger index) {
        NSDictionary *modify = @{@"title":[item objectForKey:@"title"],@"flag":[NSNumber numberWithBool:![[item objectForKey:@"flag"] boolValue]]};
        return modify;

    }];


![](https://raw.githubusercontent.com/shaojiankui/MultiSelectView/master/thumb.gif)