//
//  ViewController.m
//  RuntimeButton
//
//  Created by fans on 16/5/28.
//  Copyright © 2016年 ielpm. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+FF.h"

@interface ViewController ()
@property (strong, nonatomic) UIView *colorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    title.text =@"btn 连续点击";
    [self.view addSubview:title];
    UIButton *runtimebTn = [UIButton buttonWithType:UIButtonTypeSystem];
    runtimebTn.frame = CGRectMake(0, 100, 80, 40);
    [self.view addSubview:runtimebTn];
    [runtimebTn addTarget:self action:@selector(runtimeAction:) forControlEvents:UIControlEventTouchUpInside];
    [runtimebTn setTitle:@"runtime" forState:UIControlStateNormal];
    
    UIButton *normal = [UIButton buttonWithType:UIButtonTypeSystem];
    normal.frame = CGRectMake(0, 200, 80, 40);
    [self.view addSubview:normal];
    [normal addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [normal setTitle:@"normal" forState:UIControlStateNormal];

    runtimebTn.fjl_acceptEventInterval = 2;//设置失效时间
    
    self.colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 50, 50)];
    [self.view addSubview:self.colorView];
    [self.colorView setBackgroundColor:[UIColor redColor]];
}
- (void)runtimeAction:(id)sender {
    self.colorView.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:2 animations:^{
        self.colorView.center = CGPointMake(100, 500);
    } completion:^(BOOL finished) {
        self.colorView.center = CGPointMake(25, 100);
    }];
}
- (void)buttonAction:(id)sender {
    self.colorView.backgroundColor = [UIColor blueColor];
    
    [UIView animateWithDuration:2 animations:^{
        self.colorView.center = CGPointMake(200, 500);
    } completion:^(BOOL finished) {
        self.colorView.center = CGPointMake(25, 100);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

