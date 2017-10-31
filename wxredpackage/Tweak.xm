@interface CMessageWrap
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

%hook CMessageMgr
- (void)AsyncOnAddMsg:(NSString *)wxid MsgWrap:(CMessageWrap *)wrap {
    NSInteger uiMessageType = [wrap m_uiMessageType];
    NSString *nsMsgSource = [wrap m_nsMsgSource];
    NSString *nsContent = [wrap m_nsContent];
    NSString *nsToUsr = [wrap m_nsToUsr];
    NSString *nsFromUsr = [wrap m_nsFromUsr];
    NSString *nsAtUserList = [wrap m_nsAtUserList];
    NSString *nsBizChatId = [wrap m_nsBizChatId];
    NSString *nsBizClientMsgID = [wrap m_nsBizClientMsgID];
    NSString *nsKFWorkerOpenID = [wrap m_nsKFWorkerOpenID];
    NSString *nsDisplayName = [wrap m_nsDisplayName];
    NSString *nsPattern = [wrap m_nsPattern];
    NSString *nsRealChatUsr = [wrap m_nsRealChatUsr];
    NSString *nsPushContent = [wrap m_nsPushContent];

    NSLog(@"m_uiMessageType=%zd m_nsContent=%@ m_nsFromUsr=%@ m_nsToUsr=%@ m_nsAtUserList=%@ m_nsBizChatId=%@ m_nsBizClientMsgID=%@ m_nsDisplayName=%@ m_nsKFWorkerOpenID=%@ m_nsMsgSource=%@ m_nsPattern=%@ m_nsPushContent=%@ m_nsRealChatUsr=%@",
    uiMessageType,
    nsContent,
    nsFromUsr,
    nsToUsr,
    nsAtUserList,nsBizChatId,
    nsBizClientMsgID,
    nsDisplayName,
    nsKFWorkerOpenID,
    nsMsgSource,
    nsPattern,
    nsPushContent,
    nsRealChatUsr);

        if( 1 == uiMessageType ){ //普通消息
            if( 0 == nsPushContent.length){
                if([nsToUsr rangeOfString:@"filehelper"].location != NSNotFound)
                    NSLog(@"[文件助手: %@]",nsContent);
                else  NSLog(@"[我: %@]",nsContent);
            }else
                NSLog(@"[%@]",nsPushContent);
        }else if ( 3 == uiMessageType ){ //图片消息
            NSLog(@"收到图片消息");
        }else if ( 49 == uiMessageType ){ //红包消息
            NSLog(@"收到红包消息");
        }

    %orig;
}
%end
