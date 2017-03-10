//
//  ChannelModel.h
//  NetNews
//
//  Created by kyx on 17/3/10.
//  Copyright © 2017年 kyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

//频道名称
@property (nonatomic,copy)NSString * tname;
//频道id
@property (nonatomic,copy)NSString * tid;
//获取模型的方法
+ (NSArray *)getChannelModelArray;
@end
