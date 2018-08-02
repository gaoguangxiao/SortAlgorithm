//
//  ViewController.m
//  SortMath
//
//  Created by gaoguangxiao on 2018/8/2.
//  Copyright © 2018年 gaoguangxiao. All rights reserved.
//

#import "ViewController.h"
#import "NSString+B.h"
#import "NSString+A.h"

#import "MyView.h"
@interface ViewController ()

@end

@implementation ViewController

//方法的区别
//1、load调用在initialize前面，都会被系统最多调用一次
//2、都可以手动进行调用

//load对象没有实例 也会加载

+ (void)load{
    NSLog(@"%s",__func__);
}
+(void)initialize{
     NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //
//    MyView *v = [[[NSBundle mainBundle]loadNibNamed:@"MyView" owner:nil options:nil] firstObject];
//    MyView *v = [[MyView alloc]init];
//    [self.view addSubview:v];
    
    
    //研究给某个类扩展两个类目，先调用那个方法
    //    int i = 100;
    //    while (i > 0) {
    //        i -- ;
    //        [NSString test1];
    //    }
    
    //算法的概念
//    算法是对特定问题求解步骤的一种描述
    
    //时间复杂度：算法执行 需要耗费多长时间
    //常见的时间复杂度：常数阶，对数阶，线性阶，线性对数阶，平方阶，立方阶，K次方阶，指数阶
    
//    空间复杂度：执行算法执行过程中，临时占用存储空间的大小 S(N) = O(F(n)) 其中n为问题的规模
//    算法执行时所需的存储空间包括两部分，
//    固定部分：数据空间（常量，变量）等所需空间，指令空间 即代码空间
//      可变空间：这部分与算法本身有关，包括动态空间的分配，以及递归栈的调用
    

    
    
//    NSArray *arr = @[@7,@1,@5,@3,@4,@2,@10,@9];
//    NSLog(@"排序之前的：%@",arr);
//    NSArray *new = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        return obj1 > obj2;
//    }];
//    NSLog(@"%@",new);
    
    
    //堆排序
//    [self sortingForHeapWithArray:[arr mutableCopy]];

    //冒泡排序
//     [self sortingForBubblingWithArray:[arr mutableCopy]];
    
    //快速排序：找准一个基准元素，通常选择第一个元素或者最后一个元素
//    通过一趟排序 将数据分割成两部分，其中一部分元素比基准数值小，一部分元素比基准数值大
//    然后基准元素在最正确的位置
//    然后对这两部分记录 用同样的方法继续进行排序 直到整个序列有序
    
//    [self mybottleSort:[arr mutableCopy]];
//
//    [self mySimpleSort:[arr mutableCopy]];
//
//    [self insertSort:[arr mutableCopy]];
    
//    [self QuickSorkOC:[arr mutableCopy] Count:arr.count];
    
//    [self myquickSort:[arr mutableCopy] andStartIndex:0 andEndIndex:arr.count - 1];
}
#pragma mark - 快速排序
-(void)myquickSort:(NSMutableArray *)array andStartIndex:(NSInteger )startIndex andEndIndex:(NSInteger )endIndex{
    if (startIndex >= endIndex) {
        return;
    }
    NSInteger i = startIndex;
    NSInteger j = endIndex;
    id tmp = array[i];
    
    while (i < j) {
        while (i<j&&array[j] >= tmp) {
            j--;
        }
        array[i] = array[j];
        while (i<j&&array[i] <= tmp) {
            i++;
        }
        array[j] = array[i];
    }
    
    
    array[i] = tmp;
    
    [self myquickSort:array andStartIndex:startIndex andEndIndex:i-1];

    [self myquickSort:array andStartIndex:i + 1 andEndIndex:endIndex];
    
    NSLog(@"快速排序：%@",array);

}

- (NSMutableArray *)QuickSorkOC:(NSMutableArray *)array Count:(NSInteger)count
{
    
    NSInteger i = 0;
    
    NSInteger j = count - 1;
    
    id pt = array[0];
    
    
    
    if (count > 1) {
        
        while (i < j) {
            
            for (; j > i; --j) {
                
                if (array[j] < pt) {
                    
                    array[i++] = array[j];//
                    
                    break;
                    
                }
                
            }
            
            for (; i < j; ++i) {
                
                if (array[i] > pt) {
                    
                    array[j--] = array[i];
                    
                    break;
                    
                }
                
            }
            
            array[i] = pt;//将基准数放到最合适的位置
            
            [self QuickSorkOC:array Count:i];
            
            [self QuickSorkOC:array Count:count - i - 1];
            
        }
        
    }
    
    NSLog(@"快速排序：%@",array);
    return array;
}

#pragma mark - 编写插入排序
-(void)insertSort:(NSMutableArray *)array{
    NSInteger j ,i;
    for (i = 1; i < array.count; i++) {
        id tmp = array[i];
        for (j = i; j > 0 && tmp < array[j - 1]; j -- ) {
            array[j] = array[j - 1];//小的后移动
        }
        array[j] = tmp;
//        NSLog(@"tmp:%@",tmp);
    }
    NSLog(@"插入排序：%@",array);
    
}

#pragma mark - 编写冒泡排序
-(void)mybottleSort:(NSMutableArray *)array{
    for (NSInteger i = 0; i < array.count; i++) {
        for (NSInteger j = 0; j < array.count - 1 - i; j ++) {
            if (array[j] > array[j + 1]) {
                id tmp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = tmp;
            }
        }
    }
    NSLog(@"冒泡排序：%@",array);
}
#pragma mark - 编写简单排序
//时间复杂度 n^2
-(void)mySimpleSort:(NSMutableArray *)array{
    for (NSInteger i = 0; i< array.count; i++) {
        NSInteger k = i;
        
        for (NSInteger j = i + 1; j < array.count; j ++) {
            if (array[k] > array[j]) {
                id  tmp = array[j];
                array[j] = array[k];
                array[k] = tmp;
            }
        }
    }
    NSLog(@"简单排序：%@",array);
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
