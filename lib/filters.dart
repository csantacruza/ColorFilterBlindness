import 'package:gallery_acess/subFilter.dart';
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
    subFilters.add(new TritanopiaScaleSubFilter());
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
