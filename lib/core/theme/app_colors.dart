import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color primary = Color.fromRGBO(0, 36, 95, 1);
  static const Color red = Color.fromRGBO(231, 44, 49, 1.0);
  static const Color orange = Color.fromRGBO(242, 140, 3, 1.0);
  static const Color grayLight = Color.fromRGBO(230, 230, 241, 1);
  static const Color grayBlue = Color.fromRGBO(125, 126, 138, 1);
  static const Color radiusMap = Color.fromRGBO(38, 52, 113, 0.219);
  static const Color grey = Color.fromRGBO(71, 71, 73, 1);
  static const Color blueRecoverPass = Color.fromRGBO(0, 85, 184, 1);
  static const Color grayMiddle = Color.fromRGBO(147, 147, 178, 1);
  //----------------------------------------------------------------
  static const Color validationTimely = Color.fromRGBO(0, 196, 140, 1);
  static const Color validationMissing = Color.fromRGBO(231, 44, 49, 1);
  static const Color validationLate = Color.fromRGBO(239, 202, 102, 1);
  static const Color validationJustified = Color.fromRGBO(242, 140, 3, 1);

  //----------------------------------------------------------------
  static const Color degradedInitial = Color.fromARGB(255, 247, 85, 45);
  static const Color shadowButton = Color.fromARGB(137, 71, 70, 70);
  static const Color logoBad = Color.fromARGB(255, 244, 55, 22);
  static const Color logoRight = Color.fromARGB(255, 76, 201, 170);
  static const Color degradedStart = Color.fromRGBO(237, 128, 26, 1);
  static const Color blueDark = Color.fromRGBO(38, 52, 113, 1);
  static const Color modalBarrier = Color.fromARGB(33, 87, 85, 85);
  static const Color contentNotification = Color.fromRGBO(247, 248, 253, 1);
  static const Color redLoading = Color.fromRGBO(230, 0, 0, 0.8);
  static const Color black = Color.fromRGBO(27, 21, 61, 1.0);

  static const Color grayDark = Color.fromRGBO(47, 46, 65, 1);
  static const Color light = Color.fromRGBO(239, 239, 239, 1.0);
  static const Color green = Color.fromRGBO(76, 175, 80, 1);
  static const Color yellow = Color.fromRGBO(255, 235, 59, 1);
  //-----------
  static const Color purpleCustom = Color.fromRGBO(53, 43, 200, 1);
  static const Color blueCustom = Color.fromRGBO(47, 119, 234, 1);

  static const Color borderForm = Color.fromRGBO(230, 230, 241, 1);

  static const Color green02 = Color.fromRGBO(0, 166, 90, 1);
  static const Color green03 = Color.fromRGBO(0, 166, 90, 0.65);
  static const Color orangeCustom = Color.fromRGBO(221, 75, 57, 1);
  static const Color purpleCustomLoading = Color.fromRGBO(53, 43, 200, 0.8);
  static const Color blueCustomLoading = Color.fromRGBO(47, 119, 234, 0.8);
  static const Color giftColor = Color.fromRGBO(223, 240, 216, 1.0);
  static const Color noConectionColor = Color.fromRGBO(246, 185, 278, 1.0);

  static const Color graySchedule = Color.fromARGB(255, 243, 243, 243);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      orange,
      red,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  //---
  static const LinearGradient primaryGradientLoading = LinearGradient(
    colors: [
      redLoading,
      redLoading,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient greenGradientLoading = LinearGradient(
      colors: [green03, green03],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  //----------------------------------------------------------------
  static const String mapStyles = '''[
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#f5f5f5"
        }
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#616161"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#f5f5f5"
        }
      ]
    },
    {
      "featureType": "administrative.land_parcel",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#bdbdbd"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#eeeeee"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#e5e5e5"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9e9e9e"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#ffffff"
        }
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#dadada"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#616161"
        }
      ]
    },
    {
      "featureType": "road.local",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9e9e9e"
        }
      ]
    },
    {
      "featureType": "transit.line",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#e5e5e5"
        }
      ]
    },
    {
      "featureType": "transit.station",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#eeeeee"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#c9c9c9"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9e9e9e"
        }
      ]
    }
  ]''';
}
