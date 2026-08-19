import 'package:flutter/material.dart';

enum DevicesType { Mobile, Tablet, Desktop }

DevicesType getDeviceType(MediaQueryData mediaQueryData) {
  double width = 0;
  Orientation orientation = mediaQueryData.orientation;
  if (orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }
  if (width >= 950) {
    return DevicesType.Desktop;
  }
  if (width >= 600) {
    return DevicesType.Tablet;
  }
  return DevicesType.Mobile;
}
