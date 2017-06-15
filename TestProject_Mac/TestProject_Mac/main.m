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

#import "NSArray+deepCopy.h"
int main (int argc, const char *argv[]) {
    NSArray *arry1 = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSArray *array2 = [arry1 mutableDeepCopy];
    NSLog(@"copied end :%@", array2);
}
