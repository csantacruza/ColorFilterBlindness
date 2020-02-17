import 'dart:typed_data';

import 'package:gallery_acess/utils.dart';
import 'package:photofilters/filters/color_filters.dart';
import 'package:photofilters/filters/image_filters.dart';
import 'package:photofilters/models.dart';

class BlindnessSubFilter extends ColorSubFilter with ImageSubFilter {
  String typeBlindness;
  BlindnessSubFilter(String s){
    typeBlindness = s;
  }
  
  @override
  void apply(Uint8List pixels) => blindnessImage(pixels,typeBlindness);

  ///Apply the [DeuteranopiaSubFilter] to a color.
  @override
  RGBA applyFilter(RGBA color) => blindnessColor(color,typeBlindness);
}
