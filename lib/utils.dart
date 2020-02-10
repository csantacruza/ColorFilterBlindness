import 'dart:math';
import 'dart:typed_data';

import 'package:photofilters/utils/utils.dart';


int clampPixel(int x) => x.clamp(0, 255);

void grayscale(Uint8List bytes) {
  for (int i = 0; i < bytes.length; i += 4) {
    int r = bytes[i], g = bytes[i + 1], b = bytes[i + 2];
    int avg = clampPixel((0.2126 * r + 0.7152 * g + 0.0722 * b).round());
    bytes[i] = avg;
    bytes[i + 1] = avg;
    bytes[i + 2] = avg;
  }
}

void tritanopiascale(Uint8List bytes){
  for (int i = 0; i < bytes.length; i += 4) {
    int r = bytes[i], g = bytes[i + 1], b = bytes[i + 2];
    int avg = clampPixel((0.2126 * r + 0.7152 * g + 0.0722 * b).round());
    bytes[i] = avg;
    bytes[i + 1] = avg;
    bytes[i + 2] = avg;
  }
}