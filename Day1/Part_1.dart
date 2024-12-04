import 'dart:convert';
import 'dart:io';

void main() async {
  String filePath = 'input.txt';
  File file = File(filePath);

  Stream<String> lines = file.openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter());

  int totalDistances = 0;
  List<int> left = [],  right =  [];

  try {
    await for (String line in lines) {
      // List<String> words = line.split(RegExp(r"\s+"));
      List<String> words = line.split("   ");
      int locationIDLeft = int.parse(words[0]);
      int locationIDRight = int.parse(words[1]);
      left.add(locationIDLeft);
      right.add(locationIDRight);
    }

    left.sort();
    right.sort();

    for (int i = 0; i < left.length; i++) {
      totalDistances += (right[i] - left[i]).abs();
    }
    print(totalDistances);
  } catch (e) {
    print('Error: $e');
  }
}
