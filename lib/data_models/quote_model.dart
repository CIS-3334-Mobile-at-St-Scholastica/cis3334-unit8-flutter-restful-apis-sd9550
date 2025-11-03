// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<QuoteModel> welcomeFromJson(String str) => List<QuoteModel>.from(json.decode(str).map((x) => QuoteModel.fromJson(x)));

String welcomeToJson(List<QuoteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class QuoteModel {
  String quote;
  String author;
  String work;
  List<String> categories;

  QuoteModel({
    required this.quote,
    required this.author,
    required this.work,
    required this.categories,
  });

  List<String> get facts => [quote];

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
    quote: json["quote"],
    author: json["author"],
    work: json["work"],
    categories: List<String>.from(json["categories"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "quote": quote,
    "author": author,
    "work": work,
    "categories": List<dynamic>.from(categories.map((x) => x)),
  };
}