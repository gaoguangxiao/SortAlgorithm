//
//  MatchInifo.h
//  iOSObjectSort
//
//  Created by gaoguangxiao on 2020/4/14.
//  Copyright © 2020 gaoguangxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MatchInifo : NSObject

/**0：未开、1：上半场、2：中场、3：下半场、4：加时、5：点球、-1：完场、-10:取消、-11:待定、-12:腰斩、-13:中断、-14:推迟 */
@property (nonatomic, strong) NSString *state;

@property (nonatomic, strong) NSString *sortState;//排序所用状态 -14转-4、

@property(nonatomic,strong)NSString *time;
@end

NS_ASSUME_NONNULL_END
