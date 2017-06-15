//
//  main.m
//  TestProject_Mac
//
//  Created by Upixels_ on 17/6/15.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <asl.h>

//#define LogUnility(fmt,...)\
//        NSLog(@"File:%s Function:%s, Line:%d, time:%s [%s]" fmt, __FILE__, __FUNCTION__, __LINE__, __DATE__, __TIME__, ##__VA_ARGS__);
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        char c = 'a';
//        NSLog(@"c:%C", c);
//        
//        float f = 1234.56789f;
//        NSLog(@"f:%.2f", f);//format: %[flags][width][.perc][F|N|h|L]type
//        
//        LogUnility("%s", "abc");
//    }
//    return 0;
//}


//#import "MyObj.h"
//#define ReleaseObj(obj) \
//                        if(obj) {\
//                            while([obj retainCount]>1) {\
//                                [obj release];\
//                            }\
//                            [obj release];\
//                            obj = nil;\
//                        }
//
//
//void printRetainCount(NSObject *obj) {
//    NSLog(@"retainCount:%ld", [obj retainCount]);
//}
//
//int main (int argc, const char *argv[]) {
//    MyObj *str = [[MyObj alloc] init];
//    printRetainCount(str);
//    [str retain];
//    printRetainCount(str);
//    ReleaseObj(str);
////    [str release];
////    printRetainCount(str);
////    [str release];
////    printRetainCount(str);
//}


//int main (int argc, const char *argv[]) {
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    
//    int retVal = NSApplicationMain(argc, argv, nil);
//    [pool release];
//    
//    return retVal;
//}


//int main (int argc, const char *argv[]) {
//    NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
//    NSLog(@"OBJ:%p, retainCount:%ld", obj, [obj retainCount]);
//    NSObject *objCpy = [obj copy];
//    NSLog(@"OBJ:%p, retainCount:%ld", objCpy, [objCpy retainCount]);
//    NSObject *objRetain = [obj retain];
//    NSLog(@"OBJ:%p, retainCount:%ld", objRetain, [objRetain retainCount]);
//}

//#import "NSArray+deepCopy.h"
//int main (int argc, const char *argv[]) {
//    NSArray *arry1 = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
//    NSArray *array2 = [arry1 mutableDeepCopy];
//    NSLog(@"copied end :%@", array2);
//}

//int main (int argc, const char *argv[]) {
//    NSString *str = [[NSString alloc] initWithString:@"123"];
//    CFStringRef cfString = (__bridge CFStringRef) str;
////    CFStringRef cfString_retain = (__bridge_retained CFStringRef) str;
////    CFStringRef cfString = (__bridge_transfer CFStringRef) str;//__bridge_transfer 转移了对象的所有权，所以不需要调用release。
//}

//int main (int argc, const char *argv[]) {
//    NSString *gString = @"";
//    NSLog(@"\"%@\" address: %p", gString, gString);
//    gString = [gString stringByAppendingString:@"1"];
//    NSLog(@"\"%@\" address: %p", gString, gString);
//    gString = [gString stringByAppendingString:@"2"];
//    NSLog(@"\"%@\" address: %p", gString, gString);
//    gString = [gString stringByAppendingString:@"3"];
//    NSLog(@"\"%@\" address: %p", gString, gString);
//    gString = [gString stringByAppendingString:@"4"];
//    NSLog(@"\"%@\" address: %p", gString, gString);
//}

//int main (int argc, const char *argv[]) {
//    NSString *aString = @"~/Desktop/test.txt";
//    aString = [aString stringByExpandingTildeInPath];//~转全路径
//    NSLog(@"path:%@", aString);
//    
//    NSError *error = nil;
//    BOOL b = [aString writeToFile:aString atomically:YES encoding:NSUTF8StringEncoding error:&error];
//}

//int main (int argc, const char *argv[]) {
//    NSSet *bSet = [NSSet setWithObjects:@"2", @"3", @"4", nil];
//    NSMutableSet *aSet = [NSMutableSet setWithCapacity:0];
//    [aSet addObject:@"1"];
//    NSString *str = [[NSString alloc] initWithString:@"2"];
//    [aSet addObject:str];
//    [aSet unionSet: bSet];
//    
//    NSLog(@"aSet:%@", aSet);
//    
//    NSSet *cSet = [NSSet setWithObjects:@"3", nil];
//    [cSet intersectsSet:aSet];//不知道怎么样？
//    NSLog(@"aSet:%@", aSet);
//}

//int main (int argc, const char *argv[]) {
//    NSMutableDictionary *aDict = [NSMutableDictionary dictionaryWithObject:@"ShangHai" forKey:@"city"];
//    
//    NSDictionary *bDict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Zhang",@"30",@"175", nil] forKeys:[NSArray arrayWithObjects:@"NAME",@"AGE",@"HEIGHT", nil]];
//    
//    id oneObj = [bDict objectForKey:@"AGE"];
//    if ([oneObj isKindOfClass:[NSString class]]) {
//        NSLog(@"age is :%@", oneObj);
//    }
//    
//    id test = [bDict objectForKey:@"AGE"];
//    if ([test isKindOfClass:[NSString class]]) {
//        NSLog(@"age is :%@", test);
//    }
//    
//    NSEnumerator *aEnumerator = [bDict objectEnumerator];
//    id tempObj = nil;
//    while (tempObj = [aEnumerator nextObject]) {
//        NSLog(@"value:%@", tempObj);
//    }
//    
//    NSLog(@"++++++++++++++++++++++");
//    
//    [aDict addEntriesFromDictionary:bDict];
//    aEnumerator = [aDict objectEnumerator];
//    while (tempObj = [aEnumerator nextObject]) {
//        NSLog(@"value:%@", tempObj);
//    }
//}

//int main (int argc, const char *argv[]) {
//    NSDecimalNumber *aNumber = [NSDecimalNumber decimalNumberWithString:@"9e11"];
//    NSLog(@"aNumber:%@", aNumber);
//    
//    NSDecimalNumber *bNumber = [NSDecimalNumber decimalNumberWithMantissa:9 exponent:11 isNegative:NO];
//    NSLog(@"bNumber:%@", bNumber);
//    
//    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
//    NSNumber *numberTest = [NSNumber numberWithDouble:1234.56789];
//    
//    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
//    NSLog(@"show number1:[%@]", [numberFormatter stringFromNumber:numberTest]);
//    
////    [numberFormatter setRoundingMode:NSNumberFormatterRoundDown];
//    [numberFormatter setPositiveFormat:@",##0.##"];//"#" 表示预设位，当数字没有此位时，则舍去不补位；“0”表示位数，当数字没有此位时会以0去补位：小数点前必须有
//    NSLog(@"show number2:[%@]", [numberFormatter stringFromNumber:numberTest]);
//    
//}

//int main (int argc, const char *argv[]) {
//    NSArray *array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
//    [array writeToFile:[@"~/Desktop/test.plist" stringByExpandingTildeInPath] atomically:YES];
//}

int main (int argc, const char *argv[]) {
    
}
