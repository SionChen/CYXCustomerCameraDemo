//
//  ViewController.m
//  CYXCustomerCameraDemo
//
//  Created by 超级腕电商 on 2019/2/22.
//  Copyright © 2019年 超级腕电商. All rights reserved.
//

#import "ViewController.h"
#import "CYXCamera/CYXCameraViewController.h"
@interface ViewController ()

@end

@implementation ViewController
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CYXCameraViewController * viewController = [[CYXCameraViewController alloc] init];
    viewController.isCardFront = NO;
    [self presentViewController:viewController animated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
