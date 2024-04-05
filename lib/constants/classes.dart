
class Feature{
  String name; String svg; String? subtitle;
  Feature({required this.name, required this.svg, this.subtitle});
}


class Data{
  String title;  String date;  String time;  // String link;
  Data({required this.title, required this.date, required this.time});
}

class Shorlisted{
  String name; String subject;
  Shorlisted({required this.name, required this.subject});
}


class Animal {
  final int? id;  final String? name;
  Animal({    this.id,    this.name,  });
}

class ProfileDetails{
  final String?title; final String?svg; final String?data;
  ProfileDetails({required this.svg, required this.data, required this.title});
}


class Transaction{
  final String?date; final String?purpose; final String?amount; final bool?success;
  Transaction({required this.date, required this.purpose, required this.amount,required this.success});
}