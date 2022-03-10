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


/*
 
 
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self testISAPointer];
    

    
}

- (void)testInstanceSizeSample {
    //    NSObject *obj = [[NSObject alloc] init];
    //    // 8 返回实例对象的成员变量占用的大小class_getInstanceSize
    //    NSLog(@"%zd",class_getInstanceSize([NSObject class]));
    //    // 16 获取obj指针所指向的内存的大小malloc_size
    //    NSLog(@"%zd",malloc_size((__bridge const void *)(obj)));
        
    //    Person *person = [[Person alloc] init];
    //    NSLog(@"Person == %zd",class_getInstanceSize([Person class]));
    //    NSLog(@"Person == %zd",malloc_size((__bridge const void *)(person)));
    //
    //
    //    Student *stu = [[Student alloc] init];
    //    NSLog(@"Student == %zd",class_getInstanceSize([Student class]));
    //    NSLog(@"Student == %zd",malloc_size((__bridge const void *)(stu)));
}


- (void)testIsaClass {
    
    //成员变量的值
    Person *person = [[Person alloc] init];
    
    //isa superclass 对象方法列表 属性列表 协议列表 成员变量列表
    Class cls1 = [person class];
    Class cls2 = object_getClass(person);
    Class cls3 = [Person class];
    Class cls4 = [[Person class] class];
    NSLog(@"%p -- %p -- %p",cls1, cls3, cls4);
    
    //每个类只有一个元类对象 isa superclass 类方法信息
    Class metaCls = object_getClass(cls2);
    
    NSLog(@"%p -- %p -- %p",person, cls2, metaCls);
    
    //传入字符串类名，返回对应的类对象
//    objc_getClass(<#const char * _Nonnull name#>)
    
}

- (void)testClassMethod {
    
//    Student *stu = [[Student alloc] init];
    //unrecognized selector sent to class
    //unrecognized selector sent to instance
    NSLog(@"%p -- %p",[Student class], [Person class]);
    [Student test];
    [Person test];
}

- (void)testISAPointer {
    
    Student *stu = [[Student alloc] init];
    
    Class stuCls = [Student class];
    
    Class meta_stu = object_getClass(stuCls);
    
//    Person *person = [[Person alloc] init];
//
//    Class perCls = [Person class];
//
//    Class meta_per = object_getClass(perCls);
    
}

@end
