import 'package:flutter/material.dart';

class AppConstants {
  static Color primaryColors = Color(0xffFF6610);
  static Color secondaryColor = Color(0xff010101);
}

TextStyle mTextStyle12({
  Color mColors = Colors.black,
  FontWeight mFontWeight = FontWeight.normal,
}) {
  return TextStyle(
    fontSize: 12,
    fontWeight: mFontWeight,
    color: mColors,
    fontFamily: 'Poppins',
  );
}

TextStyle mTextStyle14({
  Color mColors = Colors.black,
  FontWeight mFontWeight = FontWeight.normal,
}) {
  return TextStyle(
    fontSize: 14,
    fontWeight: mFontWeight,
    color: mColors,
    fontFamily: 'Poppins',
  );
}

TextStyle mTextStyle16({
  Color mColors = Colors.black,
  FontWeight mFontWeight = FontWeight.normal,
}) {
  return TextStyle(
    fontSize: 16,
    fontWeight: mFontWeight,
    color: mColors,
    fontFamily: 'Poppins',
  );
}

TextStyle mTextStyle24({
  Color mColors = Colors.black,
  FontWeight? mFontWeight ,
}) {
  return TextStyle(
    fontSize: 24,
    fontWeight: mFontWeight,
    color: mColors,
    fontFamily: 'Poppins',
  );
}

TextStyle mTextStyle34({
  Color mColors = Colors.black,
  FontWeight? mFontWeight ,
}) {
  return TextStyle(
    fontSize: 34,
    fontWeight: mFontWeight,
    color: mColors,
    fontFamily: 'Poppins',
  );
}