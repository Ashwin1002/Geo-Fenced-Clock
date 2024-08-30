import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// Shimmer Color
  static const shimmerBaseColor = Color(0xFFE0E0E0);
  static const shimmerHighlightColor = Color(0xFFEEEEEE);

  ///Foundation Light
  static const Color primaryLightA = Color(0xff030918);
  static const Color primaryLightB = Color(0xffF0F0F2);

  static const Color accentLight = Color(0xff228BE6);
  static const Color warningLight = Color(0xffFFCC00);

  static const Color positiveLight = Color(0xff1FB65D);
  static const Color negativeLight = Color(0xffFF453A);
  static const Color purpleIndicator = Color(0xff3A5FF7);
  static const Color strokeLight = Color(0xffF2F2F2);
  static const Color buttonHover = Color(0xff1A9C4F);

  ///Background Light
  static const Color backgroundPrimaryLight = Color(0xffFFFFFF);
  static const Color backgroundInverserPrimaryLight = Color(0xff030918);

  static const Color backgroundSecondaryLight = Color(0xffF2F2F7);
  static const Color backgroundInverserSecondaryLight = Color(0xff353A46);

  static const Color backgroundTeritiaryLight = Color(0xff868E96);
  static const Color backgroundAccentLight = Color(0xffD4EEFC);

  ///Content light
  static const Color contentPrimaryLight = Color(0xff030918);
  static const Color contentInversePrimaryLight = Color(0xffFFFFFF);

  static const Color contentSecondaryLight = Color(0xff000000);
  static const Color contentInverseSecondaryLight = Color(0xffCDCED1);

  static const Color contentTeritiaryLight = Color(0xff868E96);
  static const Color contentInverseTeritiaryLight = Color(0xff9A9DA3);

  ///border light
  static const Color borderOpaqueLight = Color(0xffE9ECEF);
  static const Color borderInverseOpaqueLight = Color(0xff686B74);

  static const Color borderSelectedLight = Color(0xff27ABF1);
  static const Color borderInverseSelectedLight = Color(0xffFFFFFF);

  /// foundation dark
  static const Color primaryDarkA = Color(0xffE6E6E8);
  static const Color primaryDarkB = Color(0xff353A46);

  static const Color accentDark = Color(0xff77C4F4);
  static const Color warningDark = Color(0xffF6DE6B);

  static const Color positiveDark = Color(0xff65B891);
  static const Color negativeDark = Color(0xffF47C95);

  ///Background Dark
  static const Color backgroundPrimaryDark = Color(0xff030918);
  static const Color backgroundInverserPrimaryDark = Color(0xffE6E6E8);

  static const Color backgroundSecondaryDark = Color(0xff4F535D);
  static const Color backgroundInverserSecondaryDark = Color(0xffB3B5BA);

  static const Color backgroundTeritiaryDark = Color(0xffB3B5BA);
  static const Color backgroundAccentDark = Color(0xff1A2E44);

  ///Content Dark
  static const Color contentPrimaryDark = Color(0xffFFFFFF);
  static const Color contentInversePrimaryDark = Color(0xff091022);

  static const Color contentSecondaryDark = Color(0xffCDCED1);
  static const Color contentInverseSecondaryDark = Color(0xffB3B5BA);

  static const Color contentTeritiaryDark = Color(0xff9A9DA3);
  static const Color contentInverseTeritiaryDark = Color(0xffB3B5BA);

  ///border Dark
  static const Color borderOpaqueDark = Color(0xffB3B5BA);
  static const Color borderInverseOpaqueDark = Color(0xffB3B5BA);

  static const Color borderSelectedDark = Color(0xff77C4F4);
  static const Color borderInverseSelectedDark = Color(0xff353A46);

  static const Color backgroundWarningLight = Color(0xFFFFF9DB);
  static const Color backgroundNegativeLight = Color(0xFFFFF5F5);
  static const Color backgroundGreyLight = Color(0xFFF8F9FA);

  static const MaterialColor primarySwatchLight = MaterialColor(
    0xff00A1FF,
    <int, Color>{
      50: Color.fromRGBO(43, 184, 214, .1),
      100: Color.fromRGBO(43, 184, 214, .2),
      200: Color.fromRGBO(43, 184, 214, .3),
      300: Color.fromRGBO(43, 184, 214, .4),
      400: Color.fromRGBO(43, 184, 214, .5),
      500: Color.fromRGBO(43, 184, 214, .6),
      600: Color.fromRGBO(43, 184, 214, .7),
      700: Color.fromRGBO(43, 184, 214, .8),
      800: Color.fromRGBO(43, 184, 214, .9),
      900: Color.fromRGBO(43, 184, 214, 1),
    },
  );

  static const MaterialColor primarySwatchDark = MaterialColor(
    0xFF2BB8D6,
    <int, Color>{
      50: Color.fromRGBO(119, 196, 244, .1),
      100: Color.fromRGBO(119, 196, 244, .2),
      200: Color.fromRGBO(119, 196, 244, .3),
      300: Color.fromRGBO(119, 196, 244, .4),
      400: Color.fromRGBO(119, 196, 244, .5),
      500: Color.fromRGBO(119, 196, 244, .6),
      600: Color.fromRGBO(119, 196, 244, .7),
      700: Color.fromRGBO(119, 196, 244, .8),
      800: Color.fromRGBO(119, 196, 244, .9),
      900: Color.fromRGBO(119, 196, 244, 1),
    },
  );

  static const Color transparent = Color(0x00000000);

  static const Color redGradientLeft = Color(0xffF27794);
  static const Color redGradientRight = Color(0xffF08779);
  static const List<Color> redGradient = [
    redGradientLeft,
    redGradientRight,
  ];

  static const Color redShadowColor = Color(0xffF9C1C1);

  ///
  static const Color greyGradientLeft = Color(0xffDEE2E6);
  static const Color greyGradientRight = Color(0xFFAEB2B7);
  static const List<Color> greyGradient = [
    greyGradientLeft,
    greyGradientRight,
  ];

  static const Color greyShadow = Colors.white;

  static const Color greenGradientLeft = Color(0xff00BB7D);
  static const Color greenGradientRight = Color(0xff68C937);
  static const List<Color> greenGradient = [
    greenGradientLeft,
    greenGradientRight
  ];

  static Color greenShadow = const Color(0xff30c25d).withOpacity(.29);
}
