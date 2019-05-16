import 'dart:convert' show json;

class User {
  int needPhoneNo;
  bool needUserInfo;
  String openId;
  String token;
  String xwsToken;
  UserInfo userInfo = UserInfo.fromJson({});

  User.fromParams(
      {this.needPhoneNo,
      this.needUserInfo,
      this.openId,
      this.token,
      this.xwsToken,
      this.userInfo});

  factory User(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new User.fromJson(json.decode(jsonStr))
          : new User.fromJson(jsonStr);

  User.fromJson(jsonRes) {
    needPhoneNo = jsonRes['needPhoneNo'];
    needUserInfo = jsonRes['needUserInfo'];
    openId = jsonRes['openId'];
    token = jsonRes['token'] ?? "";
    xwsToken = jsonRes['xwsToken'] ?? "";
    userInfo = jsonRes['userInfo'] == null
        ? null
        : new UserInfo.fromJson(jsonRes['userInfo']);
  }

  @override
  String toString() {
    return '{"needPhoneNo": $needPhoneNo,"needUserInfo": $needUserInfo,"openId": ${openId != null ? '${json.encode(openId)}' : 'null'},"token": ${token != null ? '${json.encode(token)}' : 'null'},"xwsToken": ${xwsToken != null ? '${json.encode(xwsToken)}' : 'null'},"userInfo": $userInfo}';
  }
}

class UserInfo {
  String aliUid;
  int allowcommenting;
  int buyQuota;
  int credit;
  int regTimeType;
  int sceneId;
  int userLevel;
  int userQuotas;
  int userType;
  int userAtime;
  int userCommentCount;
  int userCtime;
  int userFollowCount;
  int userFollowerCount;
  int userHelpFlowers;
  int userIsPriviteSms;
  int userRelationCount;
  int userStatus;
  int userSurveyScore;
  int userTopicCount;
  int followStatus; //是否关注 0-不关注 1-关注，访问自己主页就是空
  int satisfaction; //满意度
  int giveCount; //送出件数
  int thxCount; //感谢次数
  
  //上次访问时间戳 13位 毫秒值
  int lastVisitTime;

  // 加入的花园次数
  int joinHashTagCount;

  // 满意度
  int evaluationDegree;

  int userGender;

  bool isAdmin;
  bool readCommentRuleStatus;
  bool saleAdmin;
  bool isKol;
  String userAvatar;
  String userId;
  String userName;
  String userRegfrom;
  String userAddress;
  String userCell;
  String userEmail;
  String userHomecity;
  String userProfile;
  String userSecret;
  String userSetting;
  String userTitle;
  String userLevelIcon;
  String userWechatId;
  String userBackgroundImg; //背景图，没设置过展示默认图

  //上次访问时间戳 xx秒前 xx分前
  String lastVisitTimeText;

  String followCount;
  String followerCount;
  String unlikeCount;
  String likeCount;
  String userCity;

  List<dynamic> group;
  List<dynamic> viewers;

  var badgesData;

  UserInfo.fromParams(
      {this.aliUid,
      this.allowcommenting,
      this.buyQuota,
      this.credit,
      this.regTimeType,
      this.sceneId,
      this.userLevel,
      this.userQuotas,
      this.userType,
      this.userAtime,
      this.userCommentCount,
      this.userCtime,
      this.userFollowCount,
      this.userFollowerCount,
      this.userHelpFlowers,
      this.userIsPriviteSms,
      this.userRelationCount,
      this.userStatus,
      this.userSurveyScore,
      this.userTopicCount,
      this.isAdmin,
      this.readCommentRuleStatus,
      this.saleAdmin,
      this.userAvatar,
      this.userGender,
      this.userId,
      this.userName,
      this.userRegfrom,
      this.userAddress,
      this.userCell,
      this.userEmail,
      this.userHomecity,
      this.userProfile,
      this.userSecret,
      this.userSetting,
      this.userTitle,
      this.userWechatId,
      this.joinHashTagCount,
      this.followCount,
      this.followerCount,
      this.userCity,
      this.lastVisitTime,
      this.lastVisitTimeText,
      this.evaluationDegree,
      this.isKol,
      this.badgesData,
      this.followStatus,
      this.userBackgroundImg,
      this.viewers,
      this.userLevelIcon,
      this.satisfaction,
      this.giveCount,
      this.thxCount,
      this.unlikeCount,
      this.group});

  UserInfo.fromJson(jsonRes) {
    aliUid = jsonRes['aliUid'];
    allowcommenting = jsonRes['allowcommenting'];
    buyQuota = jsonRes['buyQuota'];
    credit = jsonRes['credit'];
    regTimeType = jsonRes['regTimeType'];
    sceneId = jsonRes['sceneId'];
    userLevel = jsonRes['userLevel'];
    userQuotas = jsonRes['userQuotas'];
    userType = jsonRes['userType'];
    userAtime = jsonRes['user_atime'];
    userCommentCount = jsonRes['user_comment_count'];
    userCtime = jsonRes['user_ctime'];
    userFollowCount = jsonRes['user_follow_count'];
    userFollowerCount = jsonRes['user_follower_count'];
    followCount = jsonRes['followCount'];
    followerCount = jsonRes['followerCount'];
    userHelpFlowers = jsonRes['user_help_flowers'];
    userIsPriviteSms = jsonRes['user_is_privite_sms'];
    userRelationCount = jsonRes['user_relation_count'];
    userStatus = jsonRes['user_status'];
    userSurveyScore = jsonRes['user_survey_score'];
    userTopicCount = jsonRes['user_topic_count'];
    isAdmin = jsonRes['isAdmin'];
    readCommentRuleStatus = jsonRes['readCommentRuleStatus'];
    saleAdmin = jsonRes['saleAdmin'];
    userAvatar = jsonRes['userAvatar'] ?? '';
    userGender = int.tryParse(jsonRes['userGender'].toString()) ?? 0;
    userId = jsonRes['userId'];
    userLevelIcon = jsonRes['userLevelIcon'] ?? '';
    userName = jsonRes['userName'] ?? '';
    userRegfrom = jsonRes['userRegfrom'];
    userAddress = jsonRes['user_address'] ?? '';
    userCell = jsonRes['user_cell'];
    userEmail = jsonRes['user_email'] ?? '';
    userHomecity = jsonRes['user_homecity'];
    satisfaction = jsonRes['satisfaction'] != null
        ? jsonRes['satisfaction']
        : jsonRes['Satisfaction'] != null ? jsonRes['Satisfaction'] : -1;
    userProfile = jsonRes['user_profile'] != null
        ? jsonRes['user_profile']
        : jsonRes['userProfile'] != null ? jsonRes['userProfile'] : '';
    userSecret = jsonRes['user_secret'];
    userSetting = jsonRes['user_setting'];
    userTitle = jsonRes['user_title'];
    userWechatId = jsonRes['user_wechat_id'];
    joinHashTagCount = jsonRes['joinHashTagCount'];
    userCity = jsonRes['userCity'] ?? '';
    lastVisitTimeText = jsonRes['lastVisitTimeText'] ?? '';
    evaluationDegree = jsonRes['evaluationDegree'];
    isKol = jsonRes['isKol'];
    badgesData = jsonRes['badgesData'];
    followStatus = jsonRes['followStatus'];
    userBackgroundImg = jsonRes['userBackgroundImg'];
    viewers = jsonRes['viewers'];
    unlikeCount = jsonRes['unlikeCount'];
    giveCount = jsonRes['giveCount'] ?? 0;
    thxCount = jsonRes['thxCount'] ?? 0;
    group = jsonRes['group'] == null ? null : [];

    for (var groupItem in group == null ? [] : jsonRes['group']) {
      group.add(groupItem);
    }
  }

  @override
  String toString() {
    return '{"aliUid": ${aliUid != null ? '${json.encode(aliUid)}' : 'null'},"allowcommenting": $allowcommenting,"buyQuota": $buyQuota,"credit": $credit,"regTimeType": $regTimeType,"sceneId": $sceneId,"userLevel": $userLevel,"userQuotas": $userQuotas,"userType": $userType,"user_atime": $userAtime,"user_comment_count": $userCommentCount,"user_ctime": $userCtime,"user_follow_count": $userFollowCount,"user_follower_count": $userFollowerCount,"user_help_flowers": $userHelpFlowers,"user_is_privite_sms": $userIsPriviteSms,"user_level": $userLevel,"user_relation_count": $userRelationCount,"user_status": $userStatus,"user_survey_score": $userSurveyScore,"user_topic_count": $userTopicCount,"isAdmin": $isAdmin,"readCommentRuleStatus": $readCommentRuleStatus,"saleAdmin": $saleAdmin,"userAvatar": ${userAvatar != null ? '${json.encode(userAvatar)}' : 'null'},"userGender": ${userGender != null ? '${json.encode(userGender)}' : 'null'},"userId": ${userId != null ? '${json.encode(userId)}' : 'null'},"userName": ${userName != null ? '${json.encode(userName)}' : 'null'},"userRegfrom": ${userRegfrom != null ? '${json.encode(userRegfrom)}' : 'null'},"user_address": ${userAddress != null ? '${json.encode(userAddress)}' : 'null'},"user_cell": ${userCell != null ? '${json.encode(userCell)}' : 'null'},"user_email": ${userEmail != null ? '${json.encode(userEmail)}' : 'null'},"user_homecity": ${userHomecity != null ? '${json.encode(userHomecity)}' : 'null'},"user_id": ${userId != null ? '${json.encode(userId)}' : 'null'},"user_profile": ${userProfile != null ? '${json.encode(userProfile)}' : 'null'},"user_secret": ${userSecret != null ? '${json.encode(userSecret)}' : 'null'},"user_setting": ${userSetting != null ? '${json.encode(userSetting)}' : 'null'},"user_title": ${userTitle != null ? '${json.encode(userTitle)}' : 'null'},"user_wechat_id": ${userWechatId != null ? '${json.encode(userWechatId)}' : 'null'},"group": $group}';
  }
}
