//
//  SingleObjectTests.m
//  SingleObjectTests
//
//  Created by youlianchun on 04/25/2019.
//  Copyright (c) 2019 youlianchun. All rights reserved.
//

#import "unit_tool.h"
#import "SingleObject.h"
@import XCTest;

static NSUInteger init_count = 0;

@interface Singleton : SingleObject
@end

@implementation Singleton
-(instancetype)init
{
    self = [super init];
    init_count ++;
    return self;
}
@end

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    dispatch_queue_t queue = dispatch_queue_create("com.test.serial", DISPATCH_QUEUE_SERIAL);
    dispatch_group_t group = dispatch_group_create();
    dispatch_suspend(queue);
    init_count = 0;
    NSMutableArray *arr = [NSMutableArray array];
    
    XCTestWait(self, 60, ^(void (^fulfill)(void)) {
        
        NSUInteger count = concurrent_test(10000, 100, ^{
            id obj = [[Singleton alloc] init];
            dispatch_group_async(group, queue, ^{
                [arr addObject:obj];
            });
        });
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            fulfill();
            NSCAssert(count == arr.count, @"并发测试失败");
            NSSet *set = [NSSet setWithArray:arr];
            NSCAssert(set.count == 1, @"单例创建失败 实例不唯一");
            NSCAssert(init_count == 1, @"单例创建失败 init 执行多次");
            NSLog(@"");
        });
        dispatch_resume(queue);
        
    });
}

@end

