import 'dart:typed_data';
import 'package:photofilters/models.dart';

int clampPixel(int x) => x.clamp(0, 255);

//Confuse BLUE with GREEN and YELLOW with VIOLET
void tritanopiaImage(Uint8List bytes) {
double pRed = 0.783;
double pGreen = 0.896;
double pBlue = 1;
  for (int i = 0; i < bytes.length; i += 4) {
    int r = bytes[i], g = bytes[i + 1], b = bytes[i + 2];
    if (r >= 240 && r <= 255 && g >= 240 && g <= 255 && b >= 240 && b <= 255) {
      bytes[i] = clampPixel((r).round());
      bytes[i + 1] = clampPixel((g).round());
      bytes[i + 2] = clampPixel(b).round();
    } else {
      bytes[i] = clampPixel((r * pRed).round());
      bytes[i + 1] = clampPixel((g * pGreen).round());
      bytes[i + 2] = clampPixel((b*pBlue).round());
    }
  }
}
//Confuse BLUE with GREEN and YELLOW with VIOLET
RGBA tritanopiaColor(RGBA color) {
double pRed = 0.783;
double pGreen = 0.896;
double pBlue = 1;
  if (color.red >= 240 &&
      color.red <= 255 &&
      color.green >= 240 &&
      color.green <= 255 &&
      color.blue >= 240 &&
      color.blue <= 255) {
    return new RGBA(
      red: clampPixel((color.red).round()),
      green: clampPixel((color.green).round()),
      blue: clampPixel((color.blue).round()),
      alpha: color.alpha,
    );
  } else {
    return new RGBA(
      red: clampPixel((color.red * pRed).round()),
      green: clampPixel((color.green * pGreen).round()),
      blue: clampPixel((color.blue*pBlue).round()),
      alpha: color.alpha,
    );
  }
}

//verde débil,deuteranopía
void deuteranopiaImage(Uint8List bytes) {
double pRed = 0.783;
double pGreen = 0.896;
double pBlue = 1;
  for (int i = 0; i < bytes.length; i += 4) {
    int r = bytes[i], g = bytes[i + 1], b = bytes[i + 2];
    if (r >= 240 && r <= 255 && g >= 240 && g <= 255 && b >= 240 && b <= 255) {
      bytes[i] = clampPixel((r).round());
      bytes[i + 1] = clampPixel((g).round());
      bytes[i + 2] = clampPixel(b).round();
    } else {
      bytes[i] = clampPixel((r * pRed).round());
      bytes[i + 1] = clampPixel((g * pGreen).round());
      bytes[i + 2] = clampPixel((b*pBlue).round());
    }
  }
}
//verde débil,deuteranopía
RGBA deuteranopiaColor(RGBA color) {
double pRed = 0.783;
double pGreen = 0.896;
double pBlue = 1;
  if (color.red >= 240 &&
      color.red <= 255 &&
      color.green >= 240 &&
      color.green <= 255 &&
      color.blue >= 240 &&
      color.blue <= 255) {
    return new RGBA(
      red: clampPixel((color.red).round()),
      green: clampPixel((color.green).round()),
      blue: clampPixel((color.blue).round()),
      alpha: color.alpha,
    );
  } else {
    return new RGBA(
      red: clampPixel((color.red * pRed).round()),
      green: clampPixel((color.green * pGreen).round()),
      blue: clampPixel((color.blue*pBlue).round()),
      alpha: color.alpha,
    );
  }
}


