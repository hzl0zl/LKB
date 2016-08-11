//
//  TVCell.m
//  LKBVideo
//
//  Created by zhiling on 16/8/11.
//  Copyright © 2016年 huangzhiling. All rights reserved.
//

#import "TVCell.h"
#import "UIImageView+WebCache.h"
@interface TVCell ()

@property (strong, nonatomic) IBOutlet UILabel *titleL;


@property (strong, nonatomic) IBOutlet UIImageView *imageH;


@end

@implementation TVCell


- (void)setTvModel:(TVModel *)tvModel {
    
    _tvModel = tvModel;
    self.titleL.text = tvModel.title;
    [self.imageH sd_setImageWithURL:[NSURL URLWithString:tvModel.pic]];
    
    
    
    
    
}
- (void)awakeFromNib {
  
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
