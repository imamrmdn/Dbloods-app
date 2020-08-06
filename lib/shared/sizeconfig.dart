part of 'shareds.dart';

class SizeConfig {
  static MediaQueryData mediaQueryData;
  static double defaultMargin;
  static double defaultWidth;
  static double defaultHeight;
  static double sizeWidth;
  static double sizeHeight;
  static double sizeWidth2;
  static double sizeHeight2;

  init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    defaultMargin = mediaQueryData.size.width / 20;
    defaultWidth = mediaQueryData.size.width;
    defaultHeight = mediaQueryData.size.height;
    sizeWidth = defaultWidth / 10;
    sizeHeight = defaultHeight / 10;
    sizeWidth2 = defaultWidth / 100;
    sizeHeight2 = defaultHeight / 100;
  }
}

class SizeTheme {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double sizeHorizontal;
  static double sizekVertical;

  init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    sizeHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    sizekVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
