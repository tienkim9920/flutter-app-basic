import 'package:get/get.dart';

class SumController extends GetxController {
  final countA = 0.obs;
  final countB = 0.obs;

  incrementA() => countA.value++;
  incrementB() => countB.value++;

  int get sum => countA.value + countB.value;

  @override
  void onInit() {
    ever(countA, (_) => print('Line 14'));
    once(countA, (_) => print('Line 15'));
    debounce(countA, (_) => print('Line 16'), time: Duration(seconds: 1));
    debounce(countA, (_) => print('Line 17'), time: Duration(seconds: 1));
    super.onInit();
  }
}
