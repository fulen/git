//
//  AlertActionVC.m
//  UIAlertViewANDAlertAction
//
//  Created by fulen on 2016/11/5.
//  Copyright © 2016年 min. All rights reserved.
//

#import "AlertActionVC.h"
#import "UIControl+Button.h"



#define VIEW_WIDTH self.view.frame.size.width
#define VIEW_HEIGHT self.view.frame.size.height

@interface AlertActionVC ()

@end

@implementation AlertActionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.title = @"alertAction";
    
    [self creatButton];
}

- (void)creatButton
{
    UIButton *alertActionButton = [[[UIButton alloc]init] creatButtonWithFrame:CGRectMake(10,230, VIEW_WIDTH-20, 100) backgroundColor:[UIColor redColor] title:@"alertActionButton" titleFont:[UIFont systemFontOfSize:30] actionBlock:^(UIControl *control) {
 
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    [self.view addSubview:alertActionButton];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
