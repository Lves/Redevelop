//
//  LLRedEnvelopesQueue.m
//  JimuDuMiao
//
//  Created by lixingle on 2017/11/15.
//  Copyright © 2017年 jm. All rights reserved.
//

#import "LLRedEnvelopesQueue.h"


@implementation LLRedEnvelopParam
- (NSDictionary *)toParams {
    return @{
             @"msgType": self.msgType,
             @"sendId": self.sendId,
             @"channelId": self.channelId,
             @"nickName": self.nickName,
             @"headImg": self.headImg,
             @"nativeUrl": self.nativeUrl,
             @"sessionUserName": self.sessionUserName,
             @"timingIdentifier": self.timingIdentifier
             };
}
@end

@interface LLRedEnvelopesQueue()
    @property (nonatomic, strong) NSMutableArray *array;
    @end

@implementation LLRedEnvelopesQueue
+(instancetype) sharedInstance{
    static LLRedEnvelopesQueue *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[LLRedEnvelopesQueue alloc] init];
    });
    return _instance;
}
    
-(instancetype)init{
    if (self = [super init]){
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}
    
//添加对象
-(void) addParams:(LLRedEnvelopParam *) params{
    @synchronized(self) {
        [_array addObject:params];
    }
}
//获得对象
- (LLRedEnvelopParam *) getParams:(NSString *) sendId{
    @synchronized(self) {
        NSInteger resultIndex = -1;
        for (NSInteger index = 0 ; index < self.array.count ; index++) {
            LLRedEnvelopParam *params = self.array[index];
            if ([params.sendId isEqualToString:sendId]){ //找到了
                resultIndex = index;
            }
        }
        if (resultIndex != -1 ){
            LLRedEnvelopParam *params = self.array[resultIndex];
            [self.array removeObjectAtIndex:resultIndex];
            return params;
        }
        return nil;
    }
}
    
    @end
