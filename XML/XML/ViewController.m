//
//  ViewController.m
//  XML
//
//  Created by Upixels_ on 17/6/20.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

#define SHANGHAI_CITY_ID    @"2013"
#define SAFE_RELEASE(obj)			if(obj){ [obj release]; obj = nil;}
#define SAFE_RELEASE_CARBON(obj)	if(obj){ CFRelease(obj); obj = NULL;}

@interface ViewController () <NSXMLParserDelegate> {
    NSURLConnection         *_connection;
    NSString                *_errInfo;
    NSMutableData           *_dataReceived;
    NSMutableString         *_strInfo;
}

@property (nonatomic) UITextView *text_status;

- (NSString*)parserData:(NSData *)xmlData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    self.text_status = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, 200, 400) textContainer:nil];
    self.text_status.textColor = [UIColor blackColor];
    [self.view addSubview:self.text_status];
    
    const char *xmlStr = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"\
                        "<soap12:Envelope "\
                        "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "\
                        "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "\
                        "xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">"\
                        "<soap12:Body>"\
                        "<getWeather xmlns=\"http://WebXml.com.cn/\">"\
                        "<theCityCode>%@</theCityCode>"\
                        "<theUserID>%@</theUserID>"\
                        "</getWeather>"\
                        "</soap12:Body>"\
                        "</soap12:Envelope>";
    NSData *data = [NSData dataWithBytes:xmlStr length:strlen(xmlStr)];
    [self parserData:data];
}

- (NSString*)parserData:(NSData *)xmlData {
    self.text_status.text = @"开始解析XML";
    
    NSError *error = nil;
    
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    
    //Parse begin
    [xmlParser setDelegate:self];
    if ([xmlParser parse] == NO) {
        error = [xmlParser parserError];
        if (error) {
            _errInfo = [[error localizedDescription] retain];
        } else {
            _errInfo = [@"解析数据错误" retain];
        }
        
        SAFE_RELEASE(xmlParser);
        return _errInfo;
    }
    
    SAFE_RELEASE(xmlParser);
    
    return _strInfo;
}


#pragma mark NSURLConnection delegate


#pragma mark XML delegate
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    printf("%s [\n", [elementName cStringUsingEncoding:NSUTF8StringEncoding]);
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    printf("] %s\n", [elementName cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"endDoc");
}


- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"error:%@", parseError);
}

@end
