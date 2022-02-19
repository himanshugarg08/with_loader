import 'dart:math';

bool get randomBool => Random().nextBool();

Future<String> apiCall() async {
  await Future.delayed(const Duration(milliseconds: 2000));
  return randomBool ? "Success" : await apiCallWithParameters("Failure");
}

Future<String> apiCallWithParameters(String result) async {
  return result;
}
