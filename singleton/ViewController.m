//
//  ViewController.m
//  singleton
//
//  Created by YLCHUN on 2018/3/28.
//  Copyright © 2018年 YLCHUN. All rights reserved.
//

#import "ViewController.h"
#import "SubSingleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SubSingleton *subs1 = [[SubSingleton alloc] init];
    SubSingleton *subs2 = [[SubSingleton alloc] init];

    Singleton *s1 = [[Singleton alloc] init];
    Singleton *s2 = [[Singleton alloc] init];
    subs2.str;
    NSLog(@"");
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
