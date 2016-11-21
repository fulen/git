//
//  ViewController.m
//  UIAlertViewANDAlertAction
//
//  Created by fulen on 2016/11/5.
//  Copyright © 2016年 min. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+Button.h"
#import "AlertActionVC.h"

#define VIEW_WIDTH self.view.frame.size.width
#define VIEW_HEIGHT self.view.frame.size.height


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor  = [UIColor grayColor];
    
    [self creatAlertViewButton];
    
    [self creatAlertActionButton];
}

- (void)creatAlertViewButton
{
    UIButton *alertViewButton = [[[UIButton alloc]init] creatButtonWithFrame:CGRectMake(10,100, VIEW_WIDTH-20, 100) backgroundColor:[UIColor magentaColor] title:@"alertViewButton" titleFont:[UIFont systemFontOfSize:28] actionBlock:^(UIControl *control) {
 
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"this is alertAction" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了");
            AlertActionVC *alertActionVC = [[AlertActionVC alloc] init];
            [self.navigationController pushViewController:alertActionVC animated:YES];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
        
        UIAlertAction *myAction = [UIAlertAction actionWithTitle:@"my" style:UIAlertActionStyleDestructive handler:nil];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"alertControllerTitle" message:@"alertControllerMessage" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:alertAction];
        [alertController addAction:cancelAction];
        [alertController addAction:myAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }];
    [self.view addSubview:alertViewButton];
    
}


- (void)creatAlertActionButton
{
    UIButton *alertActionButton = [[[UIButton alloc]init] creatButtonWithFrame:CGRectMake(10,230, VIEW_WIDTH-20, 100) backgroundColor:[UIColor purpleColor] title:@"alertActionButton" titleFont:[UIFont systemFontOfSize:30] actionBlock:^(UIControl *control) {
    
        NSLog(@"点击了alertActionButton");
        
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"this is alertActionButton" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了");
            AlertActionVC *alertActionVC = [[AlertActionVC alloc] init];
            [self presentViewController:alertActionVC animated:YES completion:nil];
        }];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"alertControllerTitle" message:@"alertControllerMessage" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
        
        UIAlertAction *myAction = [UIAlertAction actionWithTitle:@"myActionSheet" style:UIAlertActionStyleDefault handler:nil];

        [alertController addAction:alertAction];
        [alertController addAction:cancelAction];
        [alertController addAction:myAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        

    }];
    [self.view addSubview:alertActionButton];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
