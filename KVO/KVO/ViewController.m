//
//  ViewController.m
//  KVO
//
//  Created by ios on 2022/3/9.
//

/*
 KVO:键值监听，用于监听某个对象属性的改变
 本质：
 
 
 
 
 
 */
#import "ViewController.h"
#import "Person.h"




@interface ViewController ()

@property (nonatomic, strong) Person *pp;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.pp = [[Person alloc] init];
    self.pp.age = 10;
    
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.pp addObserver:self forKeyPath:@"age" options:options context:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    NSLog(@"点击屏幕了----");
    
    //setAge
    self.pp.age = 99;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"observeValueForKeyPath == %@ -- %@ -- %@",object,keyPath,change);
}


- (void)dealloc
{
    [self.pp removeObserver:self forKeyPath:@"age"];
}






@end


