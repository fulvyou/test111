//
//  ViewController.m
//  NetWorking
//
//  Created by Upixels_ on 17/6/20.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

#define TEST_IMAGE_LINK @"https://ww1.sinaimg.cn/large/57435d41gw1dwxj9x8mvpj.jpg"


@interface ViewController ()

@property (nonatomic) UILabel *lab_status;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    self.lab_status = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 50)];
    self.lab_status.textColor = [UIColor whiteColor];
    [self.view addSubview:self.lab_status];
    
//    [self sendSyncRequest];
    [self sendAsyncRequest];
}

#pragma mark Synchronization download
- (void) sendSyncRequest {
    NSURLRequest *request = nil;
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = nil;
    
    
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:TEST_IMAGE_LINK]];
    data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (!error) {
        if (data) {
            NSLog(@"接收到数据：【%@】", data);
        }
    }else {
        NSLog(@"错误信息：【%@】", [error localizedDescription]);
    }
}

#pragma mark Asynchronization download
- (void) sendAsyncRequest {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:TEST_IMAGE_LINK]];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void) connection: (NSURLConnection*) theConnection didReceiveResponse:(nonnull NSURLResponse *)response {
    NSHTTPURLResponse *httpResponse;
    NSString *contectTypeHeader;
    NSString *errInfo = nil;
    
    httpResponse = (NSHTTPURLResponse *)response;
    //正常的conde范围：【200~299】
    if (httpResponse.statusCode != 200) {
        errInfo = [NSString stringWithFormat:@"HTTP error %zd", httpResponse.statusCode];
    }else {
        //看一下服务器端是不是支持这种下载的图片类型
        contectTypeHeader = [httpResponse.allHeaderFields objectForKey:@"Content-Type"];
        if (contectTypeHeader == nil) {
            errInfo = @"没有Content-Type内容";
        }else if(![contectTypeHeader isEqualToString:@"image/jpeg"] &&
                 ![contectTypeHeader isEqualToString:@"image/png"] &&
                 ![contectTypeHeader isEqualToString:@"image/gif"]) {
            errInfo = [NSString stringWithFormat:@"Unsupported Content-Type  (%@)", contectTypeHeader];
        }else {
            self.lab_status.text = @"Accept http response!";
        }
    }
    
    if (errInfo) {
        self.lab_status.text = [NSString stringWithFormat:@"error:[%@]", errInfo];
    }
}

#pragma mark POST 
- (void) sendPost {
    NSMutableURLRequest *request = nil;
    NSMutableString *postContect = [NSMutableString stringWithCapacity:0];
    NSData *postBody = nil;
    NSURL *url = [NSURL URLWithString:@"https://"];
    
    //Create HTTPBody
    [postContect appendFormat:@"usernmae=%@&password=%@", @"Rose", @"123456"];
    postBody = [postContect dataUsingEncoding:NSUTF8StringEncoding];
    
    //Create NSURLRequest
    request = [NSMutableURLRequest requestWithURL:url];
    //Set http submit type
    [request setHTTPMethod:@"POST"];
    //Set HTTP HEADER'S Content of "Content-type"
    [request setHTTPBody:postBody];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%llu", postBody.length] forHTTPHeaderField:@"Content-Length"];
}

@end
