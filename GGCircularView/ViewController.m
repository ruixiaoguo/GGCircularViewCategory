//
//  ViewController.m
//  GGCircularView
//
//  Created by GRX on 2022/11/1.
//

#import "ViewController.h"
#import "UIView+GGCircular.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 顶部圆角 */
    UILabel *topLable = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 100, 50)];
    topLable.text = @"顶部圆角:";
    topLable.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:topLable];
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(100, 115, 180, 60)];
    topView.backgroundColor = [UIColor redColor];
    [topView ggSetCornerOnTopWithRadius:10.0f];
    [self.view addSubview:topView];
    /** 左侧圆角 */
    UILabel *leftLable = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, 100, 50)];
    leftLable.text = @"左侧圆角:";
    leftLable.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:leftLable];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(100, 265, 180, 60)];
    leftView.backgroundColor = [UIColor orangeColor];
    [leftView ggSetCornerOnLeftWithRadius:10.0f];
    [self.view addSubview:leftView];
    /** 右侧圆角 */
    UILabel *rightLable = [[UILabel alloc]initWithFrame:CGRectMake(50, 350, 100, 50)];
    rightLable.text = @"右侧圆角:";
    rightLable.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:rightLable];
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(100, 415, 180, 60)];
    rightView.backgroundColor = [UIColor purpleColor];
    [rightView ggSetCornerOnRightWithRadius:10.0f];
    [self.view addSubview:rightView];
    /** 底部圆角 */
    UILabel *bottemLable = [[UILabel alloc]initWithFrame:CGRectMake(50, 500, 100, 50)];
    bottemLable.text = @"底部圆角:";
    bottemLable.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:bottemLable];
    UIView *bottemView = [[UIView alloc] initWithFrame:CGRectMake(100, 565, 180, 60)];
    bottemView.backgroundColor = [UIColor brownColor];
    [bottemView ggSetCornerOnBottomWithRadius:10.0f];
    [self.view addSubview:bottemView];
}


@end
