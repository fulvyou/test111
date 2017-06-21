//
//  ViewController.m
//  CFNetwork
//
//  Created by Upixels_ on 17/6/20.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

#define SAFE_RELEASE(OBJ)\
        if(OBJ) {\
            CFRelease(OBJ);\
            OBJ = NULL;\
        }\

@interface ViewController () {
    UITextView *_statusText;
    
    CFHTTPMessageRef _request;
    CFMutableDataRef _data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    _statusText = [[UITextView alloc] initWithFrame:CGRectMake(10, 20, 200, 200)];
    _statusText.textColor = [UIColor blackColor];
    [self.view addSubview: _statusText];
    
    [self sendRequest];
}

- (void) sendRequest {
    CFReadStreamRef readStream = NULL;
    //Init DataSource
    CFStringRef urlString = CFSTR("https://ww1.sinaimg.cn/large/57435d41gw1dwxj9x8mvpj.jpg");
    CFURLRef url = CFURLCreateWithString(kCFAllocatorDefault, urlString, NULL);
    
    //Create CFHTTPMessageRef
    SAFE_RELEASE(_request)
    
    _request = CFHTTPMessageCreateRequest(kCFAllocatorDefault, CFSTR("GET"), url, kCFHTTPVersion1_1);
    if (_request) {
        CFRelease(url);
    }
    
    //Create the data's reciver
    SAFE_RELEASE(_data);
    _data = CFDataCreateMutable(kCFAllocatorDefault, 0);
    
    //读取流作为媒介来发起请求
    readStream = CFReadStreamCreateForHTTPRequest(kCFAllocatorDefault, _request);
    if (CFReadStreamOpen(readStream)) {
        BOOL done = NO;
        const long readLen = 4096;
        do {
            uint8_t buf[readLen];
            int bytesRead = CFReadStreamRead(readStream, buf, readLen);
            if (bytesRead > 0) {
                CFDataAppendBytes(_data, buf, bytesRead);
            }else if(bytesRead == 0) {
                done = YES;
            }else {
                done = YES;
            }
        } while (!done);
        
        if (_data) {
            _statusText.text = [NSString stringWithFormat:@"Recived data: %@", _data];
            NSLog(@"recived data is:%@", _data);
        }
        
        //clear
        CFReadStreamClose(readStream);
        CFRelease(readStream);
        readStream = NULL;
        
        CFRelease(_data);
        _data = NULL;
    }
}


@end
