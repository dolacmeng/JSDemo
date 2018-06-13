//
//  AppJSObject.m
//  JSDemo
//
//  Created by 许伟杰 on 2018/6/13.
//  Copyright © 2018年 JackXu. All rights reserved.
//

#import "AppJSObject.h"

@implementation AppJSObject

-(void)scan:(NSString *)message{
    NSLog(@"%@",message);
    [self.delegate scan:message];
}

@end
