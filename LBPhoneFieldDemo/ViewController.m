//
//  ViewController.m
//  LBPhoneFieldDemo
//
//  Created by Anastatica on 2017/9/4.
//  Copyright © 2017年 L0WB. All rights reserved.
//

#import "ViewController.h"
#import "LBPhoneField.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet LBPhoneField *phoneField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    self.label.text = self.phoneField.currentText;
}


@end
