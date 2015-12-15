//
//  TodayViewController.m
//  test2
//
//  Created by Rod johnson on 12/14/15.
//  Copyright (c) 2015 Rod johnson. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic, strong) NSUserDefaults *userDefaults;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end

@implementation TodayViewController

- (NSUserDefaults*)userDefaults{
    if(!_userDefaults){
        _userDefaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.rodmjay.test"];
    }
    return _userDefaults;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(userDefaultsDidChange:)
                                                     name:NSUserDefaultsDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    
    self.preferredContentSize = CGSizeMake(320, 50);
    [self updateNumberLabelText];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self updateNumberLabelText];

}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (void)userDefaultsDidChange:(NSNotification *)notification {
    [self updateNumberLabelText];
}

- (void)updateNumberLabelText {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.rodmjay.test"];
    NSInteger number = [defaults integerForKey:@"MyNumberKey"];
    self.displayLabel.text = [NSString stringWithFormat:@"%ld", (long)number];
}

@end
