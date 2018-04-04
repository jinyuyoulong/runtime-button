//
//  ViewController.m
//  RuntimeButton
//
//  Created by fans on 16/5/28.
//

#import "ViewController.h"
#import "UIControl+FF.h"

@interface ViewController ()
{
    CGPoint startPoint;
    CGPoint endPoint;
    UIColor *animateColor;
}
@property (strong, nonatomic) UIView *colorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UILabel *title = [[UILabel alloc] init];
    title.text =@"btn 连续点击";
    
    UIButton *runtimebTn = [UIButton buttonWithType:UIButtonTypeSystem];
    [runtimebTn addTarget:self action:@selector(runtimeAction:) forControlEvents:UIControlEventTouchUpInside];
    [runtimebTn setTitle:@"runtimeClick" forState:UIControlStateNormal];
    runtimebTn.fjl_acceptEventInterval = 2;//设置失效时间
    
    UIButton *normal = [UIButton buttonWithType:UIButtonTypeSystem];
    [normal addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [normal setTitle:@"normalClick" forState:UIControlStateNormal];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[title,normal,runtimebTn]];
    stackView.frame = CGRectMake(0, 100, 320, 300);
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.alignment = NSTextAlignmentCenter;
    stackView.distribution  = UIStackViewDistributionFillProportionally;
    stackView.spacing = 1;
    [self.view addSubview:stackView];

   
    self.colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 50, 50)];
    startPoint = self.colorView.center;
    endPoint = CGPointMake(100, 500);
    animateColor = [UIColor lightGrayColor];
    [self.view addSubview:self.colorView];
    [self.colorView setBackgroundColor:[UIColor redColor]];
}
- (void)runtimeAction:(id)sender {
    self.colorView.backgroundColor = animateColor;
    
    [UIView animateWithDuration:2 animations:^{
        self.colorView.center = endPoint;
    } completion:^(BOOL finished) {
        self.colorView.center = startPoint;
    }];
}
- (void)buttonAction:(id)sender {
    self.colorView.backgroundColor = animateColor;
    
    [UIView animateWithDuration:2 animations:^{
        self.colorView.center = endPoint;
    } completion:^(BOOL finished) {
        self.colorView.center = startPoint;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

