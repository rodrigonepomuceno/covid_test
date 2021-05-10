class CountryDetailsModel {
  int dialingCode;
  String flag;
  String countryCode;
  Locale locale;

  CountryDetailsModel({
    this.dialingCode,
    this.flag,
    this.countryCode,
    this.locale,
  });

  CountryDetailsModel.fromJson(Map<String, dynamic> json) {
    dialingCode = json['dialingCode'];
    flag = json['flag'];
    countryCode = json['countryCode'];
    locale =
        json['locale'] != null ? new Locale.fromJson(json['locale']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dialingCode'] = this.dialingCode;
    data['flag'] = this.flag;
    data['countryCode'] = this.countryCode;
    if (this.locale != null) {
      data['locale'] = this.locale.toJson();
    }
    return data;
  }
}

class Locale {
  String pt;
  String es;
  String en;

  Locale({this.pt, this.es, this.en});

  Locale.fromJson(Map<String, dynamic> json) {
    pt = json['pt'];
    es = json['es'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pt'] = this.pt;
    data['es'] = this.es;
    data['en'] = this.en;
    return data;
  }
}
