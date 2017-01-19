//
//  ViewController.m
//  SFSegmentControlObjc
//
//  Created by Serge Nanaev on 18.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.sfSegmentControl insertSegmentAtIndex:3 withTitle:@"4" andSelectedTitle:@"4 days"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectSegmentAtIndex:(NSInteger)index {
    NSLog(@"%li index selected", (long)index);
}


@end
