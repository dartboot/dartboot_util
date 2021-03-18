The common tools for DartBoot.

## Usage

A simple usage example:

```dart
import 'package:dartboot_util/dartboot_util.dart';

main() {
    print('Date: ${parseDate('2020-01-01')}');
    print('Json: ${encodeJson(12)}');
    print('String "abc" is empty? ${isEmpty("abc")}');
    print('Uuid: ${uid4}');
    localIp().then((ip) => print('IP: $ip'));
}
```
