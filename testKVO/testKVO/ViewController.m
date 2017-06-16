//
//  ViewController.m
//  testKVO
//
//  Created by Upixels_ on 17/6/16.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"
#import "DataSource.h"

@interface ViewController () {
    DataSource *m_dataSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    m_dataSource = [[DataSource alloc] init];
    [m_dataSource addObserver:self forKeyPath:@"data1" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld  context:@"testContent"];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 70, 40)];
    [btn setTintColor: [UIColor redColor]];
    [btn setTitle:@"addValue" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    
}

- (void) add {
    m_dataSource.data1++;
    NSLog(@"m_dataSource.data1:%ld", m_dataSource.data1);
}

#pragma mark KVO Delegate

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"keyPath:%@ object:%@ change:%@ context:%@", keyPath, object, change, context);
}


@end
