//
//  AppJSObject.h
//  JSDemo
//
//  Created by 许伟杰 on 2018/6/13.
//  Copyright © 2018年 JackXu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol AppJSObjectDelegate <JSExport>

-(void)scan:(NSString *)message;

@end

@interface AppJSObject : NSObject<AppJSObjectDelegate>

@property(nonatomic,weak) id<AppJSObjectDelegate> delegate;

@end
