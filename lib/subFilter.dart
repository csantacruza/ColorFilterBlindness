import 'dart:typed_data';

import 'package:gallery_acess/utils.dart';
import 'package:photofilters/filters/color_filters.dart';
import 'package:photofilters/filters/image_filters.dart';
import 'package:photofilters/models.dart';

class TritanopiaScaleSubFilter extends ColorSubFilter with ImageSubFilter {
  @override
  void apply(Uint8List pixels) => tritanopiaImage(pixels);

  ///Apply the [TritanopiaScaleSubFilter] to a color.
  @override
  RGBA applyFilter(RGBA color) => tritanopiaColor(color);
}
