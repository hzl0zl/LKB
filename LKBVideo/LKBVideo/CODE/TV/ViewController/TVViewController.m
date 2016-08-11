//
//  TVViewController.m
//  LKBVideo
//
//  Created by zhiling on 16/8/11.
//  Copyright © 2016年 huangzhiling. All rights reserved.
//
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "TVViewController.h"
#import "AFNetworking.h"
#import "TVModel.h"
#include "TVCell.h"
@interface TVViewController () <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getData];
    
    [self creatTblewView];
    
}
#pragma  mark 视图及数据处理
-(void)creatTblewView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"TVCell" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"tvCell"];
    
    [self.view addSubview: self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"tvCell";
    
    TVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.tvModel = self.dataArray[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}









- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)getData {
    //1、获取会话管理
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    //2、准备网址, 和参数
    /*
     http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?
     date=20151101&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213
     */
    //基地址
    NSString *urlString = @"http://neihanmanhua.vipappsina.com/online/index.php/ManhuaApi363/index/cid/video/markId/0/lastId/0";
//    //参数
//    NSDictionary *param = @{@"date" : @"20151101",
//                            @"startRecord" : @"1",
//                            @"len" : @10,
//                            @"udid" : @"1234567890",
//                            @"terminalType" : @"Iphone",
//                            @"cid" : @"213"
//                            };
    //设置返回的数据类型
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
 
    [manger GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            NSArray *arr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            for (NSDictionary *dict in arr) {
                
                TVModel *model = [[TVModel alloc] init];
                
                [model setValuesForKeysWithDictionary:dict];
                
                [self.dataArray addObject:model];
                
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
                
            });
            
            
            
            
        }else {
            NSLog(@"没有数据");
        }
       
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    


    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
