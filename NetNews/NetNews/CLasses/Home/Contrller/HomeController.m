//
//  HomeController.m
//  NetNews
//
//  Created by kyx on 17/3/10.
//  Copyright © 2017年 kyx. All rights reserved.
//

#import "HomeController.h"
#import <YYModel.h>
#import "ChannelModel.h"
#import "channelLabel.h"

@interface HomeController ()
//类型视图
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;
//新闻视图
@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;
//布局对象
@property (weak, nonatomic) IBOutlet UINavigationItem *flowLayout;
//
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    //视图不向下偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self requestChannelData];
}

//获取频道数据
- (void)requestChannelData {
    
    NSArray *modelArray = [ChannelModel getChannelModelArray];
    
    //遍历频道数组创建对应的频道
    //频道label大小
    CGFloat labelHeight = 44;
    CGFloat lableWidth = 80;
    for(NSInteger i = 0; i < modelArray.count;i++){
        //获取对应的模型数据
        ChannelModel *model = modelArray[i];
        //创建label
        channelLabel *label = [[channelLabel alloc]initWithFrame:CGRectMake(i * lableWidth, 0, lableWidth, labelHeight)];
        label.text = model.tname;
        //设置文字大小和居中方式
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [self.channelScrollView addSubview: label];

    }

    //设置scrollView的内容大小
    self.channelScrollView.contentSize = CGSizeMake(lableWidth * modelArray.count, 0);
    //不显示垂直和水平方向的滚动指示器
    self.channelScrollView.showsVerticalScrollIndicator = NO;
    self.channelScrollView.showsHorizontalScrollIndicator = NO;

}

@end
