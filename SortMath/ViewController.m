//
//  ViewController.m
//  SortMath
//
//  Created by gaoguangxiao on 2018/8/2.
//  Copyright © 2018年 gaoguangxiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //算法的概念
//    算法是对特定问题求解步骤的一种描述
    
    NSArray *arr = @[@7,@1,@5,@3,@4,@2,@10,@9];
    NSLog(@"排序之前的：%@",arr);
//    NSArray *new = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        return obj1 > obj2;
//    }];
//    NSLog(@"%@",new);
    
    
    //堆排序
//    [self sortingForHeapWithArray:[arr mutableCopy]];

     [self sortingForBubblingWithArray:[arr mutableCopy]];
    
}

#pragma mark - 简单选择排序
-(void)test:(NSArray *)arr{
    NSMutableArray *array = [arr mutableCopy];
    NSLog(@"排序之前的：%@",array);
    //1、简单选择排序
    //思路：在要排序的一组数中，选择最小或者最大的一个数与第一个位置的数交换，然后在剩下的数中再找最小或者最大的数与第二个位置交换，依次类推，直到第n-1和第n个元素交换
    int k;
    for (int i = 0; i<array.count; i++) {
        k = i;//
        //找到数组中 最小的那个元素
        for (int j = i+1; j<array.count; j++) {
            //判断当前元素是否大于后面的，是，将小数值索引赋值给K，
            if (array[k] > array[j] ) {//
                k = j;
            }
        }
        if (k!=i) {
            id temp = array[i];
            array[i]= array[k];
            array[k]= temp;
        }
        NSLog(@"第%d次 -- %@",i,array);
    }
    NSLog(@"排序之后的：%@",array);
}

#pragma mark - 堆排序
-(void)sortingForHeapWithArray:(NSMutableArray *)array{
    for (int i = (int)(array.count -1)/2; i>=0; --i) {
        // 3 2 1 0 ：6
        [self heapSortingWithArray:array startIndex:i arrayifCount:(int)array.count-1];
    }
    NSLog(@"堆排序调整之后：%@",array);
    
//    中间数值 大于二倍两个 大于二倍两个+1
    
    //倒序遍历，将末尾的元素插入第一个位置
    for (int i = (int)array.count-1; i>0; --i) {
        id temp = array[i];
        array[i] = array[0];
        array[0] = temp;
        [self heapSortingWithArray:array startIndex:0 arrayifCount:i];
    }
    NSLog(@"二次堆排：序%@",array);
}
-(void)heapSortingWithArray:(NSMutableArray *)array startIndex:(int)startIndex arrayifCount:(int)count{
    id temp = array[startIndex];
    int child = 2*startIndex +1;
    while (child<count) {
        //前一个小于 后一个，将计数+1
        if (child+1<count &&array[child]<array[child+1]) {
            ++child;
        }
        //找到堆顶元素，也就是
        if (array[startIndex]<array[child]) {
            array[startIndex] = array[child];
            startIndex = child;
            child = 2*startIndex+1;
        }else{
            break;
        }
        array[startIndex] = temp;
    }
    NSLog(@"array:%@",array);
}

#pragma mark - 冒泡排序

/**
 冒泡排序

 @param array 让较大的数值 向下沉，相邻的数值进行比较。
 |和简单选择排序的比较，
 */
-(void)sortingForBubblingWithArray:(NSMutableArray *)array{
    //外层循环用于次数判定
    for (NSInteger i = 0; i < array.count; i++) {
        
        //内层循环用于数值比较 交换
        for (NSInteger j = 0; j< array.count - 1 - i; j++) {
            //相邻的数 进行比较
            if (array[j] > array[j + 1]) {
                id tmp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = tmp;
            }
        }
        NSLog(@"%@",array);
    }
    NSLog(@"冒泡排序之后：%@",array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
