import 'dart:convert';
import 'dart:io';

void main() async {
  String filePath = 'input.txt';
  File file = File(filePath);

  Stream<String> lines = file.openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter());

  int total = 0;
  List<int> left = [];
  Map<int, int> rightMap = {};


  try {
    await for (String line in lines) {
      List<String> words = line.split(RegExp(r"\s+"));
      int locationIDLeft = int.parse(words[0]);
      int locationIDRight = int.parse(words[1]);

      rightMap[locationIDRight] = (rightMap[locationIDRight] ?? 0) + 1;
      left.add(locationIDLeft);
    }
    print(rightMap);
    for(int i=0;i<left.length;i++){
        total += left[i]*(rightMap[left[i]] ?? 0);
    }
    print(total);

  } catch (e) {
    print('Error: $e');
  }
}
