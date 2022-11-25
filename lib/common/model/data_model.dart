// To parse this JSON data, do
//
//     final propertyModel = propertyModelFromJson(jsonString);

import 'dart:convert';

PropertyModel propertyModelFromJson(String str) => PropertyModel.fromJson(json.decode(str));

String propertyModelToJson(PropertyModel data) => json.encode(data.toJson());

class PropertyModel {
  PropertyModel({
    this.status = '',
    this.message = '',
    this.data,
  });

  String status;
  String message;
  Data? data;

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.properties,
    this.count = 0,
    this.propertyIds,
  });

  List<Property>? properties;
  int count;
  List<int>? propertyIds;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    properties: List<Property>.from(json["properties"].map((x) => Property.fromJson(x))),
    count: json["count"],
    propertyIds: List<int>.from(json["property_ids"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "properties": List<dynamic>.from(properties!.map((x) => x.toJson())),
    "count": count,
    "property_ids": List<dynamic>.from(propertyIds!.map((x) => x)),
  };
}

class Property {
  Property({
    this.id = 0,
    this.userId = 0,
    this.addressStreetName = '',
    this.addressArea = '',
    this.addressCity = '',
    this.addressPostcode = '',
    this.addressCountry,
    this.addressCityCode,
    this.addressCountryCode = '',
    this.latitude = 0,
    this.longitude = 0,
    this.propertyType = '',
    this.listingType = '',
    this.roomType = '',
    this.monthlyPrice = 0,
    this.personPrice = 0,
    this.bedrooms = 0,
    this.bathrooms = 0,
    this.moveInDate = '',
    this.lengthOfStay = '',
    this.type = '',
    this.isSuitableForStudent = 0,
    this.depositAmount = 0,
    this.currentFlatmates = 0,
    this.flatmateGender,
    this.floorPlan,
    this.description = '',
    this.slug = '',
    this.nearestLatitude = 0,
    this.nearestLongitude = 0,
    this.nearestLocation = '',
    this.nearestLocationTime = '',
    this.nearestLocationType = '',
    this.createdBy = 0,
    this.updatedBy = 0,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.propertyUrl = '',
    this.status = '',
    this.isFreeToContact = false,
    this.freeToContact = '',
    this.freeWithinDays = '',
    this.user,
    this.propertyVideos,
    this.propertyImages,
    this.propertyFloorPlans,
    this.keyFeatures,
  });

  int id;
  int userId;
  String addressStreetName;
  String addressArea;
  String addressCity;
  String addressPostcode;
  dynamic addressCountry;
  dynamic addressCityCode;
  String addressCountryCode;
  double latitude;
  double longitude;
  String propertyType;
  String listingType;
  String roomType;
  int monthlyPrice;
  int personPrice;
  int bedrooms;
  int bathrooms;
  String moveInDate;
  String lengthOfStay;
  String type;
  int isSuitableForStudent;
  int depositAmount;
  int currentFlatmates;
  dynamic flatmateGender;
  dynamic floorPlan;
  String description;
  String slug;
  double nearestLatitude;
  double nearestLongitude;
  String nearestLocation;
  String nearestLocationTime;
  String nearestLocationType;
  int createdBy;
  int updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String propertyUrl;
  String status;
  bool isFreeToContact;
  String freeToContact;
  String freeWithinDays;
  User? user;
  List<PropertyImageElement>? propertyVideos;
  List<PropertyImageElement>? propertyImages;
  List<dynamic>? propertyFloorPlans;
  List<KeyFeature>? keyFeatures;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"] ?? 0,
    userId: json["user_id"] ?? 0,
    addressStreetName: json["address_street_name"] ?? '',
    addressArea: json["address_area"] ?? '',
    addressCity: json["address_city"] ?? '',
    addressPostcode: json["address_postcode"] ?? '',
    addressCountry: json["address_country"],
    addressCityCode: json["address_city_code"],
    addressCountryCode: json["address_country_code"] ?? '',
    latitude: json["latitude"].toDouble() ?? 0.0,
    longitude: json["longitude"].toDouble() ?? 0.0,
    propertyType: json["property_type"] ?? '',
    listingType: json["listing_type"] ?? '',
    roomType: json["room_type"] ?? '',
    monthlyPrice: json["monthly_price"] ?? 0,
    personPrice: json["person_price"] ?? 0,
    bedrooms: json["bedrooms"] ?? 0,
    bathrooms: json["bathrooms"] ?? 0,
    moveInDate: json["move_in_date"] ?? '',
    lengthOfStay: json["length_of_stay"] ?? '',
    type: json["type"] ?? '',
    isSuitableForStudent: json["is_suitable_for_student"] ?? 0,
    depositAmount: json["deposit_amount"] ?? 0,
    currentFlatmates: json["current_flatmates"] ?? 0,
    flatmateGender: json["flatmate_gender"],
    floorPlan: json["floor_plan"],
    description: json["description"] ?? '',
    slug: json["slug"] ?? '',
    nearestLatitude: json["nearest_latitude"].toDouble() ?? 0.0,
    nearestLongitude: json["nearest_longitude"].toDouble() ?? 0.0,
    nearestLocation: json["nearest_location"] ?? '',
    nearestLocationTime: json["nearest_location_time"] ?? '',
    nearestLocationType: json["nearest_location_type"] ?? '',
    createdBy: json["created_by"] ?? 0,
    updatedBy: json["updated_by"] ?? 0,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    propertyUrl: json["property_url"] ?? '',
    status: json["status"] ?? '',
    isFreeToContact: json["is_free_to_contact"] ?? false,
    freeToContact: json["free_to_contact"] ?? '',
    freeWithinDays: json["free_within_days"] ?? '',
    user: User.fromJson(json["user"]),
    propertyVideos: List<PropertyImageElement>.from(json["property_videos"].map((x) => PropertyImageElement.fromJson(x))),
    propertyImages: List<PropertyImageElement>.from(json["property_images"].map((x) => PropertyImageElement.fromJson(x))),
    propertyFloorPlans: List<dynamic>.from(json["property_floor_plans"].map((x) => x)),
    keyFeatures: List<KeyFeature>.from(json["key_features"].map((x) => KeyFeature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "address_street_name": addressStreetName,
    "address_area": addressArea,
    "address_city": addressCity,
    "address_postcode": addressPostcode,
    "address_country": addressCountry,
    "address_city_code": addressCityCode,
    "address_country_code": addressCountryCode,
    "latitude": latitude,
    "longitude": longitude,
    "property_type": propertyType,
    "listing_type": listingType,
    "room_type": roomType,
    "monthly_price": monthlyPrice,
    "person_price": personPrice,
    "bedrooms": bedrooms,
    "bathrooms": bathrooms,
    "move_in_date": moveInDate,
    "length_of_stay": lengthOfStay,
    "type": type,
    "is_suitable_for_student": isSuitableForStudent,
    "deposit_amount": depositAmount,
    "current_flatmates": currentFlatmates,
    "flatmate_gender": flatmateGender,
    "floor_plan": floorPlan,
    "description": description,
    "slug": slug,
    "nearest_latitude": nearestLatitude,
    "nearest_longitude": nearestLongitude,
    "nearest_location": nearestLocation,
    "nearest_location_time": nearestLocationTime,
    "nearest_location_type": nearestLocationType,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
    "property_url": propertyUrl,
    "status": status,
    "is_free_to_contact": isFreeToContact,
    "free_to_contact": freeToContact,
    "free_within_days": freeWithinDays,
    "user": user!.toJson(),
    "property_videos": List<dynamic>.from(propertyVideos!.map((x) => x.toJson())),
    "property_images": List<dynamic>.from(propertyImages!.map((x) => x.toJson())),
    "property_floor_plans": List<dynamic>.from(propertyFloorPlans!.map((x) => x)),
    "key_features": List<dynamic>.from(keyFeatures!.map((x) => x.toJson())),
  };
}

class KeyFeature {
  KeyFeature({
    this.id = 0,
    this.type = '',
    this.name = '',
    this.darkIcon = '',
    this.colorIcon = '',
    this.darkIconUrl = '',
    this.colorIconUrl = '',
    this.pivot,
  });

  int id;
  String type;
  String name;
  String darkIcon;
  String colorIcon;
  String darkIconUrl;
  String colorIconUrl;
  Pivot? pivot;

  factory KeyFeature.fromJson(Map<String, dynamic> json) => KeyFeature(
    id: json["id"] ?? 0,
    type: json["type"] ?? '',
    name: json["name"] ?? '',
    darkIcon: json["dark_icon"] ?? '',
    colorIcon: json["color_icon"] ?? '',
    darkIconUrl: json["dark_icon_url"] ?? '',
    colorIconUrl: json["color_icon_url"] ?? '',
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "dark_icon": darkIcon,
    "color_icon": colorIcon,
    "dark_icon_url": darkIconUrl,
    "color_icon_url": colorIconUrl,
    "pivot": pivot!.toJson(),
  };
}

class Pivot {
  Pivot({
    this.propertyId = 0,
    this.keyFeatureId = 0,
  });

  int propertyId;
  int keyFeatureId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    propertyId: json["property_id"] ?? 0,
    keyFeatureId: json["key_feature_id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "property_id": propertyId,
    "key_feature_id": keyFeatureId,
  };
}

class PropertyImageElement {
  PropertyImageElement({
    this.id = 0,
    this.userId = 0,
    this.propertyId = 0,
    this.path = '',
    this.type = '',
    this.thumbnail = '',
  });

  int id;
  int userId;
  int propertyId;
  String path;
  String type;
  String thumbnail;

  factory PropertyImageElement.fromJson(Map<String, dynamic> json) => PropertyImageElement(
    id: json["id"] ?? 0,
    userId: json["user_id"] ?? 0,
    propertyId: json["property_id"] ?? 0,
    path: json["path"] ?? '',
    type: json["type"] ?? '',
    thumbnail: json["thumbnail"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "property_id": propertyId,
    "path": path,
    "type": type,
    "thumbnail": thumbnail,
  };
}

class User {
  User({
    this.id = 0,
    this.profileImage = '',
    this.name = '',
    this.profileImageUrl = '',
  });

  int id;
  String profileImage;
  String name;
  String profileImageUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    profileImage: json["profile_image"] ?? '',
    name: json["name"] ?? '',
    profileImageUrl: json["profile_image_url"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile_image": profileImage,
    "name": name,
    "profile_image_url": profileImageUrl,
  };
}
