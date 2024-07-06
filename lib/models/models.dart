import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mate_test/enums/enums.dart';
import 'package:mate_test/utils/utils.dart';

class UserModel {
  late String name;
  late String lastName;
  late Timestamp dateOfBirthday;
  late List<LanguesEnum> langages;
  late GenderEnum gender;
  late CitieModel citie;
  late String imgUrl;
  PlanModel? plan;

  UserModel({
    String? name,
    String? lastName,
    Timestamp? dateOfBirthday,
    List<LanguesEnum>? langages,
    GenderEnum? gender,
    CitieModel? citie,
    String? imgUrl,
    PlanModel? plan,
  })  : name = name ?? 'Default Name',
        lastName = lastName ?? 'Default LastName',
        dateOfBirthday = dateOfBirthday ?? Timestamp.now(),
        langages = langages ?? [],
        gender = gender ?? GenderEnum.unknown,
        citie = citie ??
            CitieModel(
                name: "UNKNOW",
                abrv: CityAbbreviation.unknown,
                country: "UNKNOW"),
        imgUrl = imgUrl ??
            "https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg";

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'lastName': lastName,
      'dateOfBirthday': dateOfBirthday,
      'langages':
          langages.map((langue) => langue.toString().split('.').last).toList(),
      'gender': gender.toString().split('.').last,
      'citie': citie.toMap(),
      'imgUrl': imgUrl,
    };

    if (plan != null) {
      map['plan'] = plan!.toMap();
    }

    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? 'Default Name',
      lastName: map['lastName'] ?? 'Default LastName',
      imgUrl: map['imgUrl'] ??
          "https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg",
      dateOfBirthday: map['dateOfBirthday'] ?? Timestamp.now(),
      langages: (map['langages'] as List?)
              ?.map<LanguesEnum>(
                  (lang) => enumFromString(lang, LanguesEnum.values))
              .toList() ??
          [],
      gender: enumFromString(map['gender'], GenderEnum.values),
      citie: CitieModel.fromMap(map['citie']), // Use CitieModel.fromMap here
      plan: map['plan'] != null ? PlanModel.fromMap(map['plan']) : null,
    );
  }
}

class UserDataModel {
  final String titleDescription;
  final String description;
  final List<ImageModel> images;
  final String banner;
  final int mates;
  final int interests;

  UserDataModel({
    required this.titleDescription,
    required this.description,
    required this.images,
    required this.banner,
    required this.mates,
    required this.interests,
  });

  Map<String, dynamic> toMap() {
    return {
      'titleDescription': titleDescription,
      'description': description,
      'images': images.map((image) => image.toMap()).toList(),
      'banner': banner,
      'mates': mates,
      'interests': interests,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      titleDescription: map['titleDescription'] ?? '',
      description: map['description'] ?? '',
      images: List<ImageModel>.from(
          map['images']?.map((item) => ImageModel.fromMap(item)) ?? []),
      banner: map['banner'] ?? '',
      mates: map['mates']?.toInt() ?? 0,
      interests: map['interests']?.toInt() ?? 0,
    );
  }
}

class CitieModel {
  final String name;
  final CityAbbreviation abrv;
  final String country;

  CitieModel({required this.name, required this.abrv, required this.country});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'abrv': abrv.toString().split('.').last,
      'country': country,
    };
  }

  factory CitieModel.fromMap(Map<String, dynamic> map) {
    return CitieModel(
      name: map['name'] as String,
      abrv: enumFromString(map['abrv'], CityAbbreviation.values),
      country: map['country'] as String,
    );
  }
}

class SelectCitieModel extends CitieModel {
  final String img;

  SelectCitieModel({
    required super.name,
    required super.abrv,
    required super.country,
    required this.img,
  });

  @override
  Map<String, dynamic> toMap() {
    //var map = ;
    //map['img'] = img;
    return super.toMap();
  }

  factory SelectCitieModel.fromMap(Map<String, dynamic> map) {
    return SelectCitieModel(
      name: map['name'] as String,
      abrv: enumFromString(map['abrv'].toLowerCase(), CityAbbreviation.values),
      country: map['country'] as String,
      img: map['img'] as String,
    );
  }

  factory SelectCitieModel.fromJson(
      Map<String, dynamic> json, List<CityAbbreviation> lstAbrv) {
    return SelectCitieModel(
      name: json['name'] as String,
      abrv: enumFromString(json['abrv'].toString().toLowerCase(), lstAbrv),
      img: json['img'] as String,
      country: json['country'] as String,
    );
  }
}

class PlanModel {
  late String citieName;
  late Timestamp startDate;
  late Timestamp endDate;
  late String activity;
  late bool lookingForFlatMate;

  PlanModel(
      {required this.citieName,
      required this.startDate,
      required this.endDate,
      required this.activity,
      this.lookingForFlatMate = false});

  Map<String, dynamic> toMap() {
    return {
      'citieName': citieName,
      'startDate': startDate,
      'endDate': endDate,
      'activity': activity,
      'lookingForFlatMate': lookingForFlatMate,
    };
  }

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      citieName: map['citieName'] as String,
      startDate: map['startDate'] as Timestamp,
      endDate: map['endDate'] as Timestamp,
      activity: map['activity'] as String,
      lookingForFlatMate: map['lookingForFlatMate'] as bool,
    );
  }
}

class ImageModel {
  final String url;
  final double ratio;

  ImageModel({
    required this.url,
    required this.ratio,
  });

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      url: map['url'],
      ratio: map['ratio'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'ratio': ratio,
    };
  }
}
