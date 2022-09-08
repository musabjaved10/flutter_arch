import 'package:flutter/material.dart';
import 'package:flutter_clean_code/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
        FontWeight fontWeight, Color color) =>
    TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: color);

TextStyle getRegularStyle({fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

// regular style
TextStyle getLightStyle({fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

// bold style
TextStyle getBoldStyle({fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

// semi Bold style
TextStyle getSemiBoldStyle({fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

// medium style
TextStyle getMediumStyle({fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}
