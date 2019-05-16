class XWSException implements Exception {
  static XWSException dataEmptyError = XWSException("999", "data都没有还成功个锤子");
  static XWSException connectionError = XWSException("-998", "连接错误咯，再来一次吧");

  String message;
  String code;
  XWSException(this.code, this.message);
  XWSException.buildDefault()
      : code = "-99",
        message = "未知错误";

  @override
  String toString() {
    return "$code : $message";
  }
}
