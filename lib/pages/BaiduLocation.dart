class BaiduLocation {
  final double latitude;
  final double longitude;
  final String country;
  final String countryCode;
  final String province;
  final String cityCode;
  final String city;
  final String district;
  final String street;
  final String locationDescribe;
  final String adCode;
  final int errorCode;
  final bool isInChina;

  BaiduLocation(
      {this.latitude,
      this.longitude,
      this.country,
      this.countryCode,
      this.province,
      this.cityCode,
      this.city,
      this.district,
      this.street,
      this.locationDescribe,
      this.adCode,
      this.errorCode,
      this.isInChina});

  factory BaiduLocation.fromMap(dynamic value) {
    return new BaiduLocation(
        latitude: value['latitude'],
        longitude: value['longitude'],
        country: value['country'],
        countryCode: value['countryCode'],
        province: value['province'],
        cityCode: value['cityCode'],
        city: value['city'],
        district: value['district'],
        street: value['street'],
        locationDescribe: value['locationDescribe'],
        adCode: value['adCode'],
        errorCode: value['errorCode'],
        isInChina: value['isInChina']);
  }

  bool isSuccess() {
    return errorCode == 161;
  }

  Map getMap() {
    return {
      "latitude": latitude,
      "longitude": longitude,
      "country": country,
      "countryCode": countryCode,
      "province": province,
      "cityCode": cityCode,
      "city": city,
      "district": district,
      "street": street,
      "locationDescribe": locationDescribe,
      "adCode": adCode,
      "errorCode": errorCode,
      "isInChina": isInChina
    };
  }
}
