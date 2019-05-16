class XWSTopicModel {
  final String topicId;
  final String mediaUrl;
  final String desc;
  final String topicPic;
  final String topicTitle;
  final String title;
  final String topicAbstract;
  final String topicVideo;
  final String videoPic;
  final String topicUrl;
  final String path;

  // if 感谢视频
  final String userAvatar; // 发送用户用户头像
  final String userName; // 发送用户用户名
  final String tag; // eg: 时尚包
  final String pageCard; // product, video, picture

  final int price;
  final int topicLikeCount;
  final int topicType;
  final int userLevel;
  final int topicStatus; //0未送出， 1已送出

  final bool showHashSign;
  final bool showLikes; // 是否显示点赞
  final bool likeStatus; // 当前用户是否一点赞
  final bool isMerchant; // 是否商家商品

  final List<dynamic> tags;
  final Map<String, dynamic> toUser; // 收到感谢视频的人

  const XWSTopicModel(
      {this.mediaUrl = '',
      this.title = '',
      this.desc = '',
      this.topicLikeCount = 0,
      this.showHashSign = true,
      this.showLikes = true,
      this.tag = '',
      this.topicUrl = '',
      this.userAvatar = '',
      this.price,
      this.topicPic,
      this.topicTitle,
      this.userName = '',
      this.likeStatus = false,
      this.topicAbstract = '',
      this.tags,
      this.toUser,
      this.topicType,
      this.topicVideo,
      this.pageCard,
      this.videoPic,
      this.path,
      this.userLevel,
      this.topicStatus,
      this.isMerchant,
      this.topicId = ''});

  factory XWSTopicModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to XWSFourLineListItemModel");
    }

    return XWSTopicModel(
        mediaUrl: json['mediaUrl'],
        title: json['title'],
        desc: json['desc'],
        topicLikeCount: json['topicLikeCount'],
        showHashSign: json['showHashSign'],
        showLikes: json['showLikes'],
        tag: json['tag'],
        topicUrl: json['topicUrl'],
        userAvatar: json['userAvatar'],
        userName: json['userName'],
        likeStatus: json['likeStatus'] == null ? false : json['likeStatus'],
        price: json['price'],
        topicPic: json['topicPic'],
        topicTitle: json['topicTitle'],
        topicAbstract: json['topicAbstract'],
        tags: json['tags'],
        toUser: json['toUser'],
        topicType: json['topicType'],
        topicVideo: json['topicVideo'],
        pageCard: json['pageCard'],
        videoPic: json['videoPic'],
        path: json['path'],
        userLevel: json['userLevel'],
        topicStatus: json['topicStatus'],
        isMerchant: json['isMerchant'],
        topicId: getId(json));
  }
}

String getId(obj) {
  if (obj['topicId'] != null) {
    return obj['topicId'];
  } else if (obj['topic_id'] != null) {
    return obj['topic_id'];
  }

  return '';
}
