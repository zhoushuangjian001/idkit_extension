import 'package:idkit_extension/idkit_extension.dart';

void main() {
  final Map<String, String> a = <String, String>{'a': '10'};
  final Map<String, String> b = <String, String>{
    'a': '00',
    'b': '10',
    'c': '20'
  };
  final Map<String, String> c = a.copyFrom(b);
  print(c); // {a: 10, b: 20}
}
