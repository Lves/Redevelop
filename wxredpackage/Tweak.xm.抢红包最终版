#import "LLRedEnvelopesQueue.h"

@interface WCBizUtil
+ (id)dictionaryWithDecodedComponets:(id)arg1 separator:(id)arg2;
@end

@interface WCPayInfoItem
@property(copy, nonatomic) NSString *m_c2cNativeUrl;
@end

@interface CMessageWrap
@property(retain, nonatomic) WCPayInfoItem *m_oWCPayInfoItem;
@property(nonatomic) unsigned int m_uiMessageType; // @synthesize m_uiMessageType;
@property(retain, nonatomic) NSString *m_nsMsgSource; // @synthesize m_nsMsgSource;
@property(retain, nonatomic) NSString *m_nsBizChatId; // @synthesize m_nsBizChatId;
@property(retain, nonatomic) NSString *m_nsBizClientMsgID; // @synthesize m_nsBizClientMsgID;
@property(retain, nonatomic) NSString *m_nsContent; // @synthesize m_nsContent;
@property(retain, nonatomic) NSString *m_nsToUsr; // @synthesize m_nsToUsr;
@property(retain, nonatomic) NSString *m_nsFromUsr; // @synthesize m_nsFromUsr;
@property(retain, nonatomic) NSString *m_nsAtUserList; // @synthesize m_nsAtUserList;
@property(retain, nonatomic) NSString *m_nsKFWorkerOpenID; // @synthesize m_nsKFWorkerOpenID;
@property(retain, nonatomic) NSString *m_nsDisplayName; // @synthesize m_nsDisplayName;
@property(retain, nonatomic) NSString *m_nsPattern; // @synthesize m_nsPattern;
@property(retain, nonatomic) NSString *m_nsRealChatUsr; // @synthesize m_nsRealChatUsr;
@property(retain, nonatomic) NSString *m_nsPushContent; // @synthesize m_nsPushContent;
@end

@interface WCRedEnvelopesControlData
@property(retain, nonatomic) CMessageWrap *m_oSelectedMessageWrap;
@property(retain, nonatomic) NSDictionary *m_structDicRedEnvelopesBaseInfo;
@end

@interface MMServiceCenter
+ (id)defaultCenter;
- (id)getService:(Class)arg1;
@end

@interface CContactMgr
- (id)getSelfContact;
@end

@interface CContact
@property(copy, nonatomic) NSString *m_nsHeadImgUrl;
@property(copy, nonatomic) NSString *m_nsUsrName;
- (NSString *)getContactDisplayName;
@end

@interface MMMsgLogicManager
- (id)GetCurrentLogicController;
@end

@interface WeixinContentLogicController
@property(strong, nonatomic) id m_contact;
@end

@interface WCPayLogicMgr
- (void)setRealnameReportScene:(unsigned int)arg1;
@end

@interface WCRedEnvelopesLogicMgr
- (void)OpenRedEnvelopesRequest:(id)arg1;
- (void)ReceiverQueryRedEnvelopesRequest:(NSDictionary *)dic;
@end



//拆红包相关
@interface SKBuiltinBuffer_t
@property(retain, nonatomic) NSData *buffer;
@property(nonatomic) unsigned int iLen;
@end

@interface HongBaoReq
//@property(retain, nonatomic) BaseRequest *baseRequest;  //存储用户设备等信息
@property(nonatomic) unsigned int cgiCmd;
@property(nonatomic) unsigned int outPutType;
@property(retain, nonatomic) SKBuiltinBuffer_t *reqText;
@end



@interface HongBaoRes
//@property(retain, nonatomic) BaseResponse *baseResponse; //存储错误信息
@property(nonatomic) int cgiCmdid; // @dynamic cgiCmdid;
@property(retain, nonatomic) NSString *errorMsg; // @dynamic errorMsg;
@property(nonatomic) int errorType; // @dynamic errorType;
@property(retain, nonatomic) NSString *platMsg; // @dynamic platMsg;
@property(nonatomic) int platRet; // @dynamic platRet;
@property(retain, nonatomic) SKBuiltinBuffer_t *retText; // @dynamic retText;
@end



/*
//抢红包
%hook WCRedEnvelopesReceiveControlLogic
- (void)WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes {
    id data = MSHookIvar<WCRedEnvelopesControlData *>(self, "m_data");

    CMessageWrap *msgWrap = [data  m_oSelectedMessageWrap];
    WCPayInfoItem *payInfoItem = [msgWrap m_oWCPayInfoItem];
    NSString *m_c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    //NSLog(@"m_c2cNativeUrl: %@", m_c2cNativeUrl);


    NSInteger length = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString *subStr  = [m_c2cNativeUrl substringFromIndex: length];
    NSDictionary *dic =  [%c(WCBizUtil) dictionaryWithDecodedComponets:subStr separator:@"&"];

    NSMutableDictionary *myDictionary = [NSMutableDictionary dictionary] ;
    [myDictionary setObject:@"1" forKey:@"msgType"];
    NSString *sendId = [dic objectForKey:@"sendid"];
    [myDictionary setObject:sendId forKey:@"sendId"];
    NSString *channelId = [dic objectForKey:@"channelid"];
    [myDictionary setObject:channelId forKey:@"channelId"];
    CContactMgr *service =  [[%c(MMServiceCenter) defaultCenter] getService:[%c(CContactMgr) class]];
    CContact *contact =  [service getSelfContact];
    NSString *displayName = [contact getContactDisplayName];
    [myDictionary setObject:displayName forKey:@"nickName"];
    NSString *headerUrl =  [contact m_nsHeadImgUrl];
    [myDictionary setObject:headerUrl forKey:@"headImg"];

    if (nil != msgWrap) {
        [myDictionary setObject:m_c2cNativeUrl forKey:@"nativeUrl"];
    }
    MMMsgLogicManager *logicManager =  [[%c(MMServiceCenter) defaultCenter] getService:[%c(MMMsgLogicManager) class]];
    WeixinContentLogicController *currentLogicController = [logicManager GetCurrentLogicController];

    if (nil != currentLogicController) {
        CContact *m_contact = [currentLogicController m_contact];
        if (nil != m_contact){
            [myDictionary setObject:[m_contact m_nsUsrName] forKey:@"sessionUserName"];
            NSLog(@"m_nsUsrName: %@",[m_contact m_nsUsrName]);
        }
    }
    NSDictionary * baseInfo = [data m_structDicRedEnvelopesBaseInfo];
    NSString *timingIdentifier = [baseInfo objectForKey:@"timingIdentifier"];
    if (0 != [timingIdentifier length]){
        [myDictionary setObject:timingIdentifier forKey:@"timingIdentifier"];
    }
    NSLog(@"真正抢红包时的参数:");
    NSArray *keys = [myDictionary allKeys];
    for (NSInteger index = 0 ; index < keys.count ; index++){
        NSLog(@"%@:%@",keys[index], [myDictionary objectForKey:keys[index]]);
    }
    //WCPayLogicMgr *payLogicMgrce = [[MMServiceCenter defaultCenter] getService: [%c(WCPayLogicMgr) class]];
    //[payLogicMgrce setRealnameReportScene:([%c(WCPayLogicMgr) class] + 0x3EB)];
    //[baseInfo objectForKeyedSubscript:@"agree_duty"];

    //WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCRedEnvelopesLogicMgr) class]];
    //[redEnvelopesLogicMgr OpenRedEnvelopesRequest:myDictionary];

   %orig;
}
%end
*/

//获得红包
%hook CMessageMgr
- (void)AsyncOnAddMsg:(NSString *)wxid MsgWrap:(CMessageWrap *)wrap {
    %orig;

    NSInteger uiMessageType = [wrap m_uiMessageType];
     if ( 49 == uiMessageType ){ //红包消息
        NSString *nsFromUsr = [wrap m_nsFromUsr];
        //抢红包
        NSLog(@"收到红包消息");
        WCPayInfoItem *payInfoItem = [wrap m_oWCPayInfoItem];
        if (payInfoItem == nil) {
            NSLog(@"payInfoItem is nil");
            return;
        }
        NSString *m_c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
        if (m_c2cNativeUrl == nil) {
            NSLog(@"m_c2cNativeUrl is nil");
            return;
        }
        NSInteger length = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
        NSString *subStr  = [m_c2cNativeUrl substringFromIndex: length];
        NSDictionary *dic =  [%c(WCBizUtil) dictionaryWithDecodedComponets:subStr separator:@"&"];

        LLRedEnvelopParam *redEnvelopParam = [[LLRedEnvelopParam alloc] init];
        redEnvelopParam.msgType = @"1";
        NSString *sendId = [dic objectForKey:@"sendid"];
        redEnvelopParam.sendId = sendId;
        NSString *channelId = [dic objectForKey:@"channelid"];
        redEnvelopParam.channelId = channelId;
        CContactMgr *service =  [[%c(MMServiceCenter) defaultCenter] getService:[%c(CContactMgr) class]];
        if (service == nil) {
            NSLog(@"service is nil");
            return;
        }
        CContact *contact =  [service getSelfContact];
        NSString *displayName = [contact getContactDisplayName];
        redEnvelopParam.nickName = displayName;
        NSString *headerUrl =  [contact m_nsHeadImgUrl];
        redEnvelopParam.headImg = headerUrl;
        if (nil != wrap) {
            redEnvelopParam.nativeUrl = m_c2cNativeUrl;
        }
        redEnvelopParam.sessionUserName = nsFromUsr;
        //存储抢红包时需要的参数
        if (sendId.length > 0)   {
            [[LLRedEnvelopesQueue sharedInstance] addParams:redEnvelopParam];
        }
        //收到红包就拆红包
        NSMutableDictionary *params = [NSMutableDictionary dictionary] ;
        if ([nsFromUsr hasSuffix:@"@chatroom"]){ //群红包
            [params setObject:@"0" forKey:@"inWay"]; //0:群聊，1：单聊
        }else {     //个人红包
            [params setObject:@"1" forKey:@"inWay"]; //0:群聊，1：单聊
        }
        [params setObject:sendId forKey:@"sendId"];
        [params setObject:m_c2cNativeUrl forKey:@"nativeUrl"];
        [params setObject:@"1" forKey:@"msgType"];
        [params setObject:channelId forKey:@"channelId"];
        [params setObject:@"0" forKey:@"agreeDuty"];
        WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCRedEnvelopesLogicMgr) class]];
        [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    }

}
%end


%hook WCRedEnvelopesLogicMgr
- (void)OnWCToHongbaoCommonResponse:(HongBaoRes *)hongBaoRes Request:(HongBaoReq *)hongBaoReq {
    %orig;
    NSLog(@"微信服务器返回数据: ");
    NSError *err;
    NSDictionary *bufferDic = [NSJSONSerialization JSONObjectWithData:hongBaoRes.retText.buffer options:NSJSONReadingMutableContainers error:&err];
    if (hongBaoRes == nil || bufferDic == nil){
        return;
    }
    if (hongBaoRes.cgiCmdid == 3) {
        int receiveStatus = [bufferDic[@"receiveStatus"] intValue];
        int hbStatus = [bufferDic[@"hbStatus"] intValue];
        if (receiveStatus == 0 && hbStatus == 2){
            NSString *timingIdentifier = bufferDic[@"timingIdentifier"];
            NSString *sendId = bufferDic[@"sendId"];
            if (sendId.length > 0 && timingIdentifier.length > 0){
                LLRedEnvelopParam *redEnvelopParam = [[LLRedEnvelopesQueue sharedInstance] getParams:sendId];
                if (nil != redEnvelopParam ){
                    redEnvelopParam.timingIdentifier = timingIdentifier;
                    NSDictionary *paramDic = [redEnvelopParam toParams];
                    sleep(1);
                    //抢红包
                    WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCRedEnvelopesLogicMgr) class]];
                    if (nil != redEnvelopesLogicMgr){
                        [redEnvelopesLogicMgr OpenRedEnvelopesRequest:paramDic];
                    }
                }
            }
        }
    }
}
%end







