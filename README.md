# singleton
单例基类

### 使用说明
直接继承 
```
@interface SubSingleton : Singleton
@end

@implementation SubSingleton
-(instancetype)init
{
    self = [super init];
    return self;
}
@end
```
#### 注意：init方法只会执行一次

### 附 并发测试函数
unit_tool
```
/*! XCTestWait.
 *  \details 等待直至 timeout 或者执行 fulfill().
 */
OBJC_EXTERN void XCTestWait(XCTestCase* self, NSTimeInterval timeout, void(^block)(void(^fulfill)(void)));


/**
 并发测试用例，超时时间请根据并发量预估，当前线程将参与测试直到并发结束。
 
 @param threadCount 并发数量 > 1
 @param runCount  执行次数 > 0
 @param block 测试代码
 @return 总执行次数 > threadCount * threadCount
 */
OBJC_EXTERN NSUInteger concurrent_test(NSUInteger threadCount, NSUInteger runCount, dispatch_block_t block);
```
