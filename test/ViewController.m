//
//  ViewController.m
//  test
//
//  Created by Rod johnson on 12/14/15.
//  Copyright (c) 2015 Rod johnson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults * userDefaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.rodmjay.test"];
    [userDefaults setInteger:4 forKey:@"MyNumberKey"];
    [userDefaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end