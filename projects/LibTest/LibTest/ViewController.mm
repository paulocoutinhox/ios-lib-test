//
//  ViewController.m
//  LibTest
//
//  Created by Paulo Coutinho on 28/11/19.
//  Copyright © 2019 PRSoluções. All rights reserved.
//

#import "ViewController.h"
#import "library.hpp"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.00 green:0.58 blue:1.00 alpha:1.0];
    
    cppTestOne();
}


@end
