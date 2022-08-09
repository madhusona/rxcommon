import 'dart:convert';

import 'package:equatable/equatable.dart';

class Comp extends Equatable {
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String previewImagePath;
  final List interest;

  const Comp({
    required this.title, 
    required this.description, 
    required this.startDate, 
    required this.endDate,
    required this.previewImagePath,
    required this.interest,
    });


   factory Comp.fromXml(List fav) {
    
    List interest;
    try {
      if (fav[22] == "") {
        interest = [];
      } else {
        interest = json.decode(utf8.decode(base64.decode(fav[22])))["Interest"];
      }
    } catch (e) {
      throw Exception();
    }
    return Comp(
      title: fav[2],
      description: fav[3],
      startDate: fav[4],
      endDate: fav[5],
      previewImagePath: fav[6],
      interest: interest,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    title,
    description,
    startDate,
    endDate,
    previewImagePath,
    interest
  ];
}