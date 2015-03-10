//
//  RootViewController.m
//  MultiSelectView
//
//  Created by Jakey on 15/3/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
}

@end
