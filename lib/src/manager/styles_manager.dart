import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fonstSize, FontWeight fontWeight, Color color,
    {String? fontFamily}) {
  return TextStyle(
    fontSize: fonstSize,
    color: color,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

// Regular TextStyle
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String? fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,
      fontFamily: fontFamily);
}

// Light TextStyle
TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String? fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color,
      fontFamily: fontFamily);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String? fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,
      fontFamily: fontFamily);
}

// SemiBold TextStyle
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String? fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
      fontFamily: fontFamily);
}

// Bold TextStyle
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String? fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color,
      fontFamily: fontFamily);
}
