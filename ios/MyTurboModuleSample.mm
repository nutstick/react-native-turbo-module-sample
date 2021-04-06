#import "MyTurboModuleSample.h"
#import <React/RCTBridge+Private.h>
#import <React/RCTUtils.h>
#import <React/RCTLog.h>

#import "MySampleTurboModuleSpec.h"

using namespace facebook::react;

@implementation MySampleTurboModule

// Backward-compatible export
RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;
@synthesize turboModuleLookupDelegate = _turboModuleLookupDelegate;

// Backward-compatible queue configuration
+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

- (std::shared_ptr<facebook::react::TurboModule>)
    getTurboModuleWithJsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
                  nativeInvoker:(std::shared_ptr<facebook::react::CallInvoker>)nativeInvoker
                     perfLogger:(id<RCTTurboModulePerformanceLogger>)perfLogger
{
    return std::make_shared<MySampleTurboModuleSpecJSI>(self, jsInvoker, nativeInvoker, perfLogger);
}

// Backward compatible invalidation
- (void)invalidate
{
    // Actually do nothing here.
    NSLog(@"Invalidating RCTSampleTurboModule...");
}

RCT_EXPORT_METHOD(addListener : (RCTResponseSenderBlock)callback)
{
    if (!callback) {
        return;
    }
    callback(@[ @"value from callback!" ]);
}

RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(NSArray<NSString *> *, getArray : (NSString *)name)
{
    NSArray<NSString *> *array = @[@"Eezy", @"Tutorials"];
    return array;
}

RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(NSDictionary *, getObject : (NSString *)name)
{
    NSDictionary *dic = @{@"key1":@"Eezy",@"key2": @"Tutorials"};
    return dic;
}

RCT_EXPORT_METHOD(getPromise
    : (NSString *) name resolve
    : (RCTPromiseResolveBlock) resolve reject
    : (RCTPromiseRejectBlock)reject)
{
    if (!resolve || !reject) {
        return;
    }

    if ([name isEqualToString:@"Johns"]) {
        reject(
            @"code_1",
            @"You are not Johns.",
            [NSError errorWithDomain:@"MySampleTurboModule" code:1 userInfo:nil]);
    } else {
        resolve(@"Hi, Johns!");
    }
}

RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(NSString *, getString : (NSString *)name)
{
    return [NSString stringWithFormat:@"%@%@", @"Hi, ", name];
}

@end
