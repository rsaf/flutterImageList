class CouponsApis {
  // 获取运费券列表
  static const String couponFreight = '/aa039/v1/mine/getCouponFreight';

  // 优惠券类表是否有红点
  static const String shopRedPath = '/lb026/coupon/user/query-red-hot';
  // 有效期内的优惠券列表
  static const String shopUnUsedPath = '/lb026/coupon/user/query-valid-coupons';
  // 已使用的优惠券列表
  static const String shopUsedPath = '/lb026/coupon/user/query-used-coupons';
  // 已经失效的优惠券列表
  static const String shopInvalidPath = '/lb026/coupon/user/query-expired-coupons';

  // 票券是否有红点
  static const String ticketRedPath = '/ca066/v1/order/virtual/red/hot';
  // 有效期内的票券列表
  static const String ticketUnUsedPath = '/ca066/v1/order/virtual/valid/list';
  // 过期的票券列表
  static const String ticketInvalidPath = '/ca066/v1/order/virtual/expired/list';

  // 查询部分商品优惠券的商品列表
  static const String topicList = '/lb026/coupon/user/items/query-items';
}
