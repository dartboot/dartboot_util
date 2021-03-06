import 'dart:mirrors';

import './pageable.dart';

/// 解析json，适配各种复杂的json
dynamic encodeJson(dynamic v) {
  if (v is num || v is String || v is bool || v is Map) {
    return v;
  }
  if (v is DateTime) {
    return v.millisecondsSinceEpoch;
  }
//  if (v is ObjectId) {
//    return v.toString();
//  }
  if (v is PageImpl) {
    return v.toJson(skipEmptyAndZero: true);
  }
  var instanceMirror = reflect(v);
  var mirror = instanceMirror.type;
  var methods = mirror.instanceMembers;
  if (methods?.containsKey(Symbol('toJson')) ?? false) {
    return encodeJson(instanceMirror.invoke(Symbol('toJson'), []).reflectee);
  }
  if (methods?.containsKey(Symbol('toString')) ?? false) {
    return encodeJson(instanceMirror.invoke(Symbol('toString'), []).reflectee);
  }
  return v;
}
