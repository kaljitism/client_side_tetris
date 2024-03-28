import 'package:web/helpers.dart';

void main() {
  final now = DateTime.now();
  final element = document.querySelector('#output') as HTMLDivElement;
  element.text = 'The time is ${now.hour}:${now.minute}:${now.second}'
      ' and your Dart web app is running!';
}
