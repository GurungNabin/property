import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Get property type by ID
String getPropertyTypeById(int index) {
  final propertyTypes = {
    1: "Apartment",
    2: "Flat",
    3: "Plot/Land",
  };

  return propertyTypes[index] ?? "Unknown"; // Return "Unknown" if index doesn't match
}

// Regular expression for URL validation
String urlExpression = r'(http|ftp|https)://([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?';
RegExp regExp = RegExp(urlExpression);

// Check if the path is a valid URL
bool checkForFileOrNetworkPath(String path) {
  return regExp.hasMatch(path);
}

// Format date string using DateFormat
String getDateFromDateTimeInSpecificFormat(DateFormat dateFormat, String date) {
  try {
    DateTime mDateTime = DateTime.parse(date);
    return dateFormat.format(mDateTime);
  } catch (e) {
    return "Invalid date"; // Handle parsing errors
  }
}

// Fetch image from network with a placeholder
Widget fetchImageFromNetworkFileWithPlaceHolder(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    placeholder: (context, url) => placeHolderAssetWidget(),
    errorWidget: (context, url, error) => placeHolderAssetWidget(),
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.transparent, 
            BlendMode.colorBurn
          ),
        ),
      ),
    ),
  );
}

// Placeholder widget
Widget placeHolderAssetWidget({double? width, double? height}) {
  const String placeholderAssetPath = 'assets/images/bg_placeholder.jpg';
  
  return Image.asset(
    placeholderAssetPath,
    fit: BoxFit.cover,
    width: width,
    height: height,
  );
}

// Fetch image from network with a placeholder and specific dimensions
Widget fetchImageFromNetworkFileWithPlaceHolderWidthHeight(double width, double height, String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    height: height,
    width: width,
    placeholder: (context, url) => placeHolderAssetWidget(width: width, height: height),
    errorWidget: (context, url, error) => placeHolderAssetWidget(width: width, height: height),
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.transparent, 
            BlendMode.colorBurn
          ),
        ),
      ),
    ),
  );
}
