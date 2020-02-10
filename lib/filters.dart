import 'package:photofilters/photofilters.dart';
import 'package:photofilters/filters/color_filters.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/subfilters.dart';

class GrayScale extends ColorFilter {
  GrayScale() : super(name: "Gray") {
    subFilters.add(new GrayScaleSubFilter());
  }
}

class InvertGrayScale extends ColorFilter {
  InvertGrayScale() : super(name: "InvertGray") {
    subFilters.add(new GrayScaleSubFilter());
    subFilters.add(new InvertSubFilter());
  }
}

class Protranopia extends ColorFilter{
  Protranopia(): super(name: "Protranopia"){
    
  }
}

class Deuteranopia extends ColorFilter{
  Deuteranopia(): super(name: "Deuteranopia"){
    
  }
}
class Tritanopia extends ColorFilter{
  Tritanopia(): super(name: "Tritanopia"){
    subFilters.add(new RGBScaleSubFilter(0, 201, 255));
    // subFilters.add(new RGBScaleSubFilter(233, 164 ,196));
    // subFilters.add(new RGBScaleSubFilter(174, 182, 244));
    // subFilters.add(new RGBScaleSubFilter(204, 180, 162));
    // subFilters.add(new RGBScaleSubFilter(51, 205, 190));
    // subFilters.add(new RGBScaleSubFilter(162, 189, 195));
    // subFilters.add(new RGBScaleSubFilter(73, 210, 61));
    // subFilters.add(new RGBScaleSubFilter(99, 169, 255));
    // subFilters.add(new RGBScaleSubFilter(119, 198, 191));
  }
}

List<Filter> blindnessFilters = [
NoFilter(),
GrayScale(),
InvertGrayScale(),
Protranopia(),
Deuteranopia(),
Tritanopia()
];
