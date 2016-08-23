//
//  ViewController.m
//  test_XML
//
//  Created by wuhaiyang on 16/8/23.
//  Copyright © 2016年 wuhaiyang. All rights reserved.
//

#import "ViewController.h"
#import "HYXMLParser.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"touchesBegan------");
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"xml"];

    NSMutableDictionary *dict = [[HYXMLParser sharedParser] getDictWithXMLPath:filePath];
    
    NSLog(@"%@", dict);
    
}

@end
