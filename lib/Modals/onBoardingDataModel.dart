// ignore_for_file: file_names

class OnBoardingDataModel {
  OnBoardingDataModel({
    this.status,
    this.message,
    this.user,
    this.courses,
    this.educationBoards,
    this.countries,
    this.preferredSession,
    this.indUniversities,
    this.personalDetails,
    this.educations,
    this.destination,
    this.tests,});

  OnBoardingDataModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['courses'] != null) {
      courses = [];
      json['courses'].forEach((v) {
        courses?.add(Courses.fromJson(v));
      });
    }
    educationBoards = json['education_boards'] != null ? json['education_boards'].cast<String>() : [];
    if (json['countries'] != null) {
      countries = [];
      json['countries'].forEach((v) {
        countries?.add(Countries.fromJson(v));
      });
    }
    preferredSession = json['preferred_session'] != null ? json['preferred_session'].cast<String>() : [];
    if (json['ind_universities'] != null) {
      indUniversities = [];
      json['ind_universities'].forEach((v) {
        indUniversities?.add(IndUniversities.fromJson(v));
      });
    }
    personalDetails = json['personal_details'] != null ? PersonalDetails.fromJson(json['personal_details']) : null;
    if (json['educations'] != null) {
      educations = [];
      json['educations'].forEach((v) {
        educations?.add(Dynamic.fromJson(v));
      });
    }
    if (json['destination'] != null) {
      destination = [];
      json['destination'].forEach((v) {
        destination?.add(Dynamic.fromJson(v));
      });
    }
    if (json['tests'] != null) {
      tests = [];
      json['tests'].forEach((v) {
        tests?.add(Dynamic.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  User? user;
  List<Courses>? courses;
  List<String>? educationBoards;
  List<Countries>? countries;
  List<String>? preferredSession;
  List<IndUniversities>? indUniversities;
  PersonalDetails? personalDetails;
  List<dynamic>? educations;
  List<dynamic>? destination;
  List<dynamic>? tests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (courses != null) {
      map['courses'] = courses?.map((v) => v.toJson()).toList();
    }
    map['education_boards'] = educationBoards;
    if (countries != null) {
      map['countries'] = countries?.map((v) => v.toJson()).toList();
    }
    map['preferred_session'] = preferredSession;
    if (indUniversities != null) {
      map['ind_universities'] = indUniversities?.map((v) => v.toJson()).toList();
    }
    if (personalDetails != null) {
      map['personal_details'] = personalDetails?.toJson();
    }
    if (educations != null) {
      map['educations'] = educations?.map((v) => v.toJson()).toList();
    }
    if (destination != null) {
      map['destination'] = destination?.map((v) => v.toJson()).toList();
    }
    if (tests != null) {
      map['tests'] = tests?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Dynamic {
  static fromJson(v) {}
}

class PersonalDetails {
  PersonalDetails({
    this.countryId,
    this.stateId,
    this.cityId,
    this.passportNumber,
    this.passportExpiry,
    this.visaRefusal,
    this.birthDate,
    this.gender,
    this.budget,
    this.fundSource,
    this.loanType,
    this.fullAddress,});

  PersonalDetails.fromJson(dynamic json) {
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    passportNumber = json['passport_number'];
    passportExpiry = json['passport_expiry'];
    visaRefusal = json['visa_refusal'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    budget = json['budget'];
    fundSource = json['fund_source'];
    loanType = json['loan_type'];
    fullAddress = json['full_address'];
  }
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  dynamic passportNumber;
  dynamic passportExpiry;
  dynamic visaRefusal;
  dynamic birthDate;
  dynamic gender;
  dynamic budget;
  dynamic fundSource;
  dynamic loanType;
  String? fullAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = countryId;
    map['state_id'] = stateId;
    map['city_id'] = cityId;
    map['passport_number'] = passportNumber;
    map['passport_expiry'] = passportExpiry;
    map['visa_refusal'] = visaRefusal;
    map['birth_date'] = birthDate;
    map['gender'] = gender;
    map['budget'] = budget;
    map['fund_source'] = fundSource;
    map['loan_type'] = loanType;
    map['full_address'] = fullAddress;
    return map;
  }

}

class IndUniversities {
  IndUniversities({
    this.id,
    this.name,});

  IndUniversities.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

class Countries {
  Countries({
    this.id,
    this.name,});

  Countries.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

class Courses {
  Courses({
    this.id,
    this.name,});

  Courses.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

class User {
  User({
    this.id,
    this.name,
    this.lastName,
    this.phone,
    this.email,
    this.countryCode,
    this.altIso2,
    this.alternatePhone,
    this.secondaryEmail,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    countryCode = json['country_code'];
    altIso2 = json['alt_iso2'];
    alternatePhone = json['alternate_phone'];
    secondaryEmail = json['secondary_email'];
  }
  int? id;
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? countryCode;
  dynamic altIso2;
  dynamic alternatePhone;
  dynamic secondaryEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['email'] = email;
    map['country_code'] = countryCode;
    map['alt_iso2'] = altIso2;
    map['alternate_phone'] = alternatePhone;
    map['secondary_email'] = secondaryEmail;
    return map;
  }

}