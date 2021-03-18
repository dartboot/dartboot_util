import 'dart:io';

/// IP地址的工具类集合
/// @author luodongseu

/// 获取本机IP地址
Future<String> localIp() async {
  for (var l in await NetworkInterface.list()) {
    for (var address in l.addresses) {
      if (address?.address != '127.0.0.1') {
        return address.address;
      }
    }
  }
  return InternetAddress.anyIPv4.address;
}
