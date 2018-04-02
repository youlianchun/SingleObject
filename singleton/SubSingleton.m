//
//  SubSingleton.m
//  singleton
//
//  Created by YLCHUN on 2018/3/28.
//  Copyright © 2018年 YLCHUN. All rights reserved.
//

#import "SubSingleton.h"

@implementation SubSingleton
-(instancetype)init {
    self = [super init];
    if (self) {
        self.str = @"112";
    }
    return self;
}
@end
