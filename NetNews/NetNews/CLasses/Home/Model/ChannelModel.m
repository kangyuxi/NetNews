//
//  ChannelModel.m
//  NetNews
//
//  Created by kyx on 17/3/10.
//  Copyright © 2017年 kyx. All rights reserved.
//

#import "ChannelModel.h"
#import <YYModel.h>

@implementation ChannelModel

+ (NSArray *)getChannelModelArray {

    //json路径
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    //获取json的二进制数据
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    //反序列化数据
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    //获取tlist对应频道的数据
    NSArray *channelDicArray = [dic objectForKey:@"tList"];
    //根据YYModel完成字典转模型
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[ChannelModel class] json:channelDicArray];
    //根据模型数据的tid进行从小到大排序
    modelArray = [modelArray sortedArrayUsingComparator:^NSComparisonResult(ChannelModel * obj1, ChannelModel * obj2) {
        //默认使用升序,如果想要降序,那么需要把参数掉转就可以了
                return [obj1.tid compare:obj2.tid];
    }];
    return modelArray;
}

@end
