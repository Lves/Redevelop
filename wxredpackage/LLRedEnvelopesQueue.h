//
//  LLRedEnvelopesQueue.h
//  JimuDuMiao
//
//  Created by lixingle on 2017/11/15.
//  Copyright © 2017年 jm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLRedEnvelopParam : NSObject
    
- (NSDictionary *)toParams;
@property (strong, nonatomic) NSString *msgType;
@property (strong, nonatomic) NSString *sendId;
@property (strong, nonatomic) NSString *channelId;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSString *headImg;
@property (strong, nonatomic) NSString *nativeUrl;
@property (strong, nonatomic) NSString *sessionUserName;
@property (strong, nonatomic) NSString *timingIdentifier;
@end


@interface LLRedEnvelopesQueue : NSObject
+(instancetype) sharedInstance;
//添加对象
-(void) addParams:(LLRedEnvelopParam *) params;
//获得对象
- (LLRedEnvelopParam *) getParams:(NSString *) sendId;
@end
