//
//  YHViewController.m
//  YHPainter
//
//  Created by yinhaofrancis on 02/19/2019.
//  Copyright (c) 2019 yinhaofrancis. All rights reserved.
//

#import "YHViewController.h"
#import <YHPainter/YHPainter.h>
@interface YHViewController ()

@end

@implementation YHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGContextRef ctx = createContextScreenScale(self.view.frame.size);
    CGContextFillRect(ctx, CGRectMake(10, 10, 100, 100));
    CGImageRef img = CGBitContextExportPNG(ctx, 0.75);
    self.view.layer.contents = (__bridge id _Nullable)(img);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
