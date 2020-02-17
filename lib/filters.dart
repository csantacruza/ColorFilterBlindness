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

class Protanopia extends ColorFilter{
  Protanopia(): super(name: "Protanopia(redblind)"){
    subFilters.add(new BlindnessSubFilter("Protanopia"));
  }
}

class Deuteranopia extends ColorFilter{
  Deuteranopia(): super(name: "Deuteranopia"+"(greenblind)"){
    subFilters.add(new BlindnessSubFilter("Deuteranopia"));
  }
}
class Tritanopia extends ColorFilter{
  Tritanopia(): super(name: "Tritanopia(blueblind)"){
    subFilters.add(new BlindnessSubFilter("Tritanopia"));
  }
}
class Protanomaly extends ColorFilter{
  Protanomaly(): super(name: "Protanomaly"){
    subFilters.add(new BlindnessSubFilter("Protanomaly"));
  }
}

class Deuteranomaly extends ColorFilter{
  Deuteranomaly(): super(name: "Deuteranomaly"){
    subFilters.add(new BlindnessSubFilter("Deuteranomaly"));
  }
}
class Tritanomaly extends ColorFilter{
  Tritanomaly(): super(name: "Tritanomaly"){
    subFilters.add(new BlindnessSubFilter("Tritanomaly"));
  }
}


List<Filter> simulateBlindnessFilters = [
NoFilter(),
GrayScale(),
InvertGrayScale(),
Protanopia(),
Deuteranopia(),
Tritanopia(),
Protanomaly(),
Deuteranomaly(),
Tritanomaly()
];

List<Filter> correctionBlindnessFilters = [
NoFilter(),

];
