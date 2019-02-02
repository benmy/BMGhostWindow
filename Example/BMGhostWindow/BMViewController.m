//
//  BMViewController.m
//  BMGhostWindow
//
//  Created by Benmy on 02/02/2019.
//  Copyright (c) 2019 Benmy. All rights reserved.
//

#import "BMViewController.h"
#import "BMGhostWindow.h"

@interface BMViewController ()

@end

@implementation BMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn addTarget:self action:@selector(showGhostWindow) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"Show" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}

- (void)showGhostWindow {
    [BMGhostWindow show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
