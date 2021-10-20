import 'dart:math';

import 'package:lorem_ipsum/lorem_ipsum.dart';

extension StringExt on String {
  get setText {
    var rand = new Random();
    var words = rand.nextInt(50);
    return this.isNotEmpty ? this : "${loremIpsum(words: words)} $words";
  }
}