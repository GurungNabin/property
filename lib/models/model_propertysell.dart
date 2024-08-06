class PropertySellModel {
  String? id;
  int? sellType;
  List<String> sellImages;
  String? sellAddress;
  String? sellCity;
  String? sellRegion;
  String? sellCountry;
  String? sellPrice;
  String? sellBathrooms;
  String? sellBedrooms;
  String? sellBalconies;
  String? sellDescription;
  String? sellContact;
  String? updatedAt;

  PropertySellModel({
    this.id,
    this.sellType,
    List<String>? sellImages,
    this.sellAddress,
    this.sellCity,
    this.sellRegion,
    this.sellCountry,
    this.sellPrice,
    this.sellBathrooms,
    this.sellBedrooms,
    this.sellBalconies,
    this.sellDescription,
    this.sellContact,
    this.updatedAt,
  }) : sellImages = sellImages ?? [];

  PropertySellModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        sellType = json['sellType'] as int?,
        sellAddress = json['sellAddress'] as String?,
        sellCity = json['sellCity'] as String?,
        sellRegion = json['sellRegion'] as String?,
        sellCountry = json['sellCountry'] as String?,
        sellPrice = json['sellPrice'] as String?,
        sellBathrooms = json['sellBathrooms'] as String?,
        sellBedrooms = json['sellBedrooms'] as String?,
        sellBalconies = json['sellBalconies'] as String?,
        sellDescription = json['sellDescription'] as String?,
        sellContact = json['sellContact'] as String?,
        updatedAt = json['updatedAt'] as String?,
        sellImages = (json['sellImages'] as List<dynamic>?)
                ?.map((item) => item as String)
                .toList() ??
            [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sellType': sellType,
      'sellAddress': sellAddress,
      'sellCity': sellCity,
      'sellRegion': sellRegion,
      'sellCountry': sellCountry,
      'sellPrice': sellPrice,
      'sellBathrooms': sellBathrooms,
      'sellBedrooms': sellBedrooms,
      'sellBalconies': sellBalconies,
      'sellDescription': sellDescription,
      'sellContact': sellContact,
      'updatedAt': updatedAt,
      'sellImages': sellImages,
    };
  }
}
