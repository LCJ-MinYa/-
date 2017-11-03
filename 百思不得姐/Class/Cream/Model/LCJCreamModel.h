//
//  LCJCreamModel.h
//  百思不得姐
//
//  Created by CA on 2017/11/3.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCJCreamModel : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * profile_image;
@property (nonatomic, copy) NSString * text;
@property (nonatomic, copy) NSString * created_at;
@property (nonatomic, assign) NSInteger ding;
@property (nonatomic, assign) NSInteger cai;
@property (nonatomic, assign) NSInteger repost;
@property (nonatomic, assign) NSInteger comment;

@end
