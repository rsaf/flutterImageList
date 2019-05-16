import 'dart:convert' show json;

class SimilarModel {

  bool nextPage;
  String requestId;
  List<SimilarData> data;

  SimilarModel.fromParams({this.nextPage, this.requestId, this.data});

  factory SimilarModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new SimilarModel.fromJson(json.decode(jsonStr)) : new SimilarModel.fromJson(jsonStr);

  SimilarModel.fromJson(jsonRes) {
    nextPage = jsonRes['nextPage'] ?? true;
    requestId = jsonRes['requestId'] ?? "";
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new SimilarData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"nextPage": $nextPage,"requestId": ${requestId != null?'${json.encode(requestId)}':'null'},"data": $data}';
  }
}

class SimilarData {

  int assemEnum;
  String requestId;
  SimilarItemData data;

  bool get isSent {
    return assemEnum == 1 && (data?.topicStatus ?? 0) == 1;
  }

  bool get isVideo {
    return assemEnum == 11;
  }

  SimilarData.fromParams({this.assemEnum, this.requestId, this.data});

  SimilarData.fromJson(jsonRes) {
    assemEnum = jsonRes['assemEnum'] ?? 0;
    requestId = jsonRes['requestId'] ?? "";
    data = jsonRes['data'] == null ? null : new SimilarItemData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"assemEnum": $assemEnum,"requestId": ${requestId != null?'${json.encode(requestId)}':'null'},"data": $data}';
  }
}

class SimilarItemData {

  String height;
  String width;
  int likeStatus;
  int price;
  int priceType;
  int topicLikeCount;
  int topicStatus;
  int topicUserLevel;
  bool isKOL;
  bool isMerchant;
  String homeCity;
  String topicId;
  String topicPic;
  String topicSetting;
  String topicTitle;
  String topicUserId;
  String userAvatar;
  String userName;
  String topicAbstract;
  String topicUserPath;
  String path;
  List<HashTagModel> hashtags;


  SimilarItemData.fromParams({this.height, this.likeStatus, this.price, this.priceType, this.topicLikeCount, this.topicStatus, this.topicUserLevel, this.width, this.isKOL, this.isMerchant, this.homeCity, this.topicId, this.topicPic, this.topicSetting, this.topicTitle, this.topicUserId, this.userAvatar, this.userName, this.topicAbstract, this.topicUserPath,this.path,this.hashtags});

  SimilarItemData.fromJson(jsonRes) {
    height = (jsonRes['height'] ?? 0).toString();
    width = (jsonRes['width'] ?? 0).toString();
    likeStatus = jsonRes['likeStatus'] ?? 0;
    price = jsonRes['price'] ?? 0;
    priceType = jsonRes['priceType'] ?? 0;
    topicLikeCount = jsonRes['topicLikeCount'] ?? 0;
    topicStatus = jsonRes['topicStatus'] ?? 0;
    topicUserLevel = jsonRes['topicUserLevel'] ?? 0;
    isKOL = jsonRes['isKOL'] ?? false;
    isMerchant = jsonRes['isMerchant'] ?? false;
    homeCity = jsonRes['homeCity'] ?? "";
    topicId = jsonRes['topicId'] ?? "";
    topicPic = jsonRes['topicPic'] ?? "";
    topicSetting = jsonRes['topicSetting'] ?? "";
    topicTitle = jsonRes['topicTitle'] ?? "";
    topicUserId = jsonRes['topicUserId'] ?? "";
    userAvatar = jsonRes['userAvatar'] ?? "";
    userName = jsonRes['userName'] ?? "";
    topicAbstract = jsonRes['topicAbstract'] ?? "";
    topicUserPath = jsonRes['topicUserPath'] ?? "";
    path = jsonRes['path'] ?? "";
    hashtags = jsonRes['hashtags'] == null ? null : [];

    for (var dataItem in hashtags == null ? [] : jsonRes['hashtags']){
      hashtags.add(dataItem == null ? null : new HashTagModel.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"height": $height,"likeStatus": $likeStatus,"price": $price,"priceType": $priceType,"topicLikeCount": $topicLikeCount,"topicStatus": $topicStatus,"topicUserLevel": $topicUserLevel,"width": $width,"isKOL": $isKOL,"isMerchant": $isMerchant,"homeCity": ${homeCity != null?'${json.encode(homeCity)}':'null'},"topicId": ${topicId != null?'${json.encode(topicId)}':'null'},"topicPic": ${topicPic != null?'${json.encode(topicPic)}':'null'},"topicSetting": ${topicSetting != null?'${json.encode(topicSetting)}':'null'},"topicTitle": ${topicTitle != null?'${json.encode(topicTitle)}':'null'},"topicUserId": ${topicUserId != null?'${json.encode(topicUserId)}':'null'},"userAvatar": ${userAvatar != null?'${json.encode(userAvatar)}':'null'},"userName": ${userName != null?'${json.encode(userName)}':'null'}}';
  }
}

class HashTagModel {

  int hashTagId;
  String path;
  String name;

  HashTagModel.fromParams({this.hashTagId, this.path, this.name});

  HashTagModel.fromJson(jsonRes) {
    hashTagId = jsonRes['hashtag_id'] ?? 0;
    path = jsonRes['path'] ?? "";
    name =  jsonRes['name'] ?? "";
  }

  @override
  String toString() {
    return '{"hashtag_id": $hashTagId,"path": $path,"name": $name}';
  }
}