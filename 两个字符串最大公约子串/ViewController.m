//
//  ViewController.m
//  两个字符串最大公约子串
//
//  Created by 王泽龙 on 2019/9/5.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *strA = @"ACDEF";
    NSString *strB = @"BDE";
    NSString *maxSubStr = [self maxSubString:strA strB:strB];
    NSLog(@"%@",maxSubStr);
}

- (NSString *)maxSubString:(NSString *)strA strB:(NSString *)strB {
    if (!strA || !strB) return @"";
    NSString *strMax = nil;
    NSString *strMin = nil;
    
    if (strA.length > strB.length) {
        strMax = strA;
        strMin = strB;
    } else {
        strMax = strB;
        strMin = strA;
    }
    
    // i控制滑动窗口的大小 start控制滑动窗口开始滑动的位置 len为滑动窗口的大小
    for (NSInteger i=0; i < strMin.length; i++) {
        for (NSInteger start=0,len=strMin.length - i; start + len <= strMin.length;start++) {
            NSString *tmpStr = [strMin substringWithRange:NSMakeRange(start, len)];
            if ([strMax containsString:tmpStr]) {
                return tmpStr;
            }
        }
    }
    
    return @"没有公约子串";
}

@end
