//
//  ViewController.m
//  ISA的本质
//
//  Created by ios on 2022/3/9.
//

#import "ViewController.h"
#import "Student.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface ViewController ()

@end

@implementation ViewController

/*
 1.xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc 文件 -o 文件
 2.源码下载：https://opensource.apple.com/tarballs
 3.class_getInstanceSize：返回实例对象的成员变量占用的大小 8的倍数
 4.malloc_size：获取obj指针所指向的内存的大小 16的倍数
 5.系统分配的内存是结构体最大内存的倍数
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    

    
//    NSObject *obj = [[NSObject alloc] init];
//    // 8 返回实例对象的成员变量占用的大小class_getInstanceSize
//    NSLog(@"%zd",class_getInstanceSize([NSObject class]));
//    // 16 获取obj指针所指向的内存的大小malloc_size
//    NSLog(@"%zd",malloc_size((__bridge const void *)(obj)));
    
    Person *person = [[Person alloc] init];
    NSLog(@"Person == %zd",class_getInstanceSize([Person class]));
    NSLog(@"Person == %zd",malloc_size((__bridge const void *)(person)));


    Student *stu = [[Student alloc] init];
    NSLog(@"Student == %zd",class_getInstanceSize([Student class]));
    NSLog(@"Student == %zd",malloc_size((__bridge const void *)(stu)));
    
}


@end
