//
//  SETTINGViewController.m
//  LKBVideo
//
//  Created by zhiling on 16/8/11.
//  Copyright © 2016年 huangzhiling. All rights reserved.
//

#import "SETTINGViewController.h"
#import "QScalableNav.h"
@interface SETTINGViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

static NSString *const kCellID = @"cell";

@implementation SETTINGViewController


- (UITableView *)tableView{
    
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc]init];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.delegate = self;
        tableView.dataSource = self;
        
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellID];
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    //    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.tableView.frame = self.view.bounds;
    
    QScalableNav *navView = [[QScalableNav alloc]initWithFrame:CGRectMake(0, 0, kSize.width, 200) backgroundImage:@"cover" headerImage:@"header" title:@"MrQ" subTitle:@"这是一段个性签名"];
    
    navView.scrollView = self.tableView; //要写在 addSubview 之前
    
    [self.view addSubview:navView];
    
    
    navView.imgActionBlock = ^(){
        NSLog(@"你点击了头像");
    };
    
    // 设置昵称与签名颜色 (默认白色)
    [navView setTitleColor:[UIColor blackColor] subTitleColor:[UIColor blueColor]];
    

    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID forIndexPath:indexPath];
    
    cell.textLabel.text = @"清除缓存";
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
