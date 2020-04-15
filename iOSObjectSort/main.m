//
//  main.m
//  iOSObjectSort
//
//  Created by gaoguangxiao on 2020/4/14.
//  Copyright © 2020 gaoguangxiao. All rights reserved.
//

/**
 未开、上半场、中场、下半场、加时、点球的比赛需要在置顶的上方区域，并且按照开赛时间正序排列；再往下
 第二部分就是完赛状态的比赛，按照开赛时间正序排列；
 第三部分区域推迟状态的比赛区域，按照开赛时间正序排列；
 第四部分为取消状态的比赛，按照开赛时间正序排列；
 第五部分为中断状态的比赛，按照开赛时间正序排列；
 第六部分为腰斩状态的比赛，按照开赛时间正序排列；
 最后部分为待定状态的比赛，按照开赛时间正序排列
 
 0：未开、1：上半场、2：中场、3：下半场、4：加时、5：点球、
 -1：完场
 -14:推迟 【有问题】
 -10:取消、【有问题】
 -13:中断、
 -12:腰斩、
 -11:待定*/

#import <Foundation/Foundation.h>
#import "MatchInifo.h"

NSComparisonResult sortKey(NSString *obj1 ,NSString *obj2){
    if (obj1 == obj2) {
//        NSLog(@"%@、%@",obj1,obj2);
        return NSOrderedSame;
    }else if ([obj1 floatValue] > [obj2 floatValue] ){
//        NSLog(@"%@、%@ - NSOrderedDescending",obj1,obj2);
        return NSOrderedDescending;
    }else {
//        NSLog(@"%@、%@ - NSOrderedAscending",obj1,obj2);
        return NSOrderedAscending;//降序
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray *stateArray = @[@"1",@"5",@"-12",@"-1",@"0",@"-13",@"2",@"-14",@"-11",@"-10",@"3",@"4"];
        NSArray *timeArray = @[@"1586910495",@"1586910435",@"1586920495",@"1583910495",@"1596910495",@"1586930495",@"1586913495",@"1586910695",@"1586904954",@"1586914435",@"1586916435",@"1586940435"];
        
        NSMutableArray *orignArray = [NSMutableArray new];
        NSInteger allCount = 34;
        for (NSInteger i = 0 ; i < allCount; i++) {
            MatchInifo *m = [MatchInifo new];
            NSInteger random = arc4random()%11;//状态
            NSString *stateString = stateArray[random];
            
            NSInteger randomTime = arc4random()%11;//时间
            NSString *timeString = timeArray[randomTime];
            
            m.state = stateString;
            m.sortState = m.state;
            m.time = timeString;
            if ([m.state integerValue] == -1) {
                m.sortState = @"-20";
            }else if ([m.state integerValue] == -10){
                m.sortState = @"-13.4";
            }
            [orignArray addObject:m];
        }

        NSString *orignState = @"";
        for (MatchInifo * mi in orignArray) {
            orignState = [NSString stringWithFormat:@"%@、%@|%@",orignState,mi.state,mi.time];
        }
        NSLog(@"旧数据：state:%@",orignState);
                
        //YES升序 NO降序
        NSSortDescriptor *stateDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"sortState" ascending:NO comparator:^NSComparisonResult(NSString  *_Nonnull obj1, NSString * _Nonnull obj2) {
            if ([obj1 integerValue] < 0 && [obj2 integerValue] < 0) {
                return sortKey(obj2, obj1);//都小于0，采用升序
            }else{
                return sortKey(obj1, obj2);
            }
            
        }];
        
        NSSortDescriptor *timeDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"time" ascending:YES];
        
        NSArray *newArray = [orignArray sortedArrayUsingDescriptors:@[stateDescriptor,timeDescriptor]];
        
        NSString *newState = @"";
        for (MatchInifo * mi in newArray) {
            newState = [NSString stringWithFormat:@"%@、%@|%@",newState,mi.state,mi.time];
        }
        NSLog(@"新数据：state:%@",newState);
        //        NSArray *array = @[]
    }
    return 0;
}


