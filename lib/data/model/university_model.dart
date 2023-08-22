import 'dart:convert';

import 'package:flutter/foundation.dart';

class UniversityModel {
  final String country;
  final List<String> domains;
  final String alpha_two_code;
  final List<String> web_pages;
  final String name;
  UniversityModel({
    required this.country,
    required this.domains,
    required this.alpha_two_code,
    required this.web_pages,
    required this.name,
  });

  UniversityModel copyWith({
    String? country,
    List<String>? domains,
    String? alpha_two_code,
    List<String>? web_pages,
    String? name,
  }) {
    return UniversityModel(
      country: country ?? this.country,
      domains: domains ?? this.domains,
      alpha_two_code: alpha_two_code ?? this.alpha_two_code,
      web_pages: web_pages ?? this.web_pages,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'country': country});
    result.addAll({'domains': domains});
    result.addAll({'alpha_two_code': alpha_two_code});
    result.addAll({'web_pages': web_pages});
    result.addAll({'name': name});
  
    return result;
  }

  factory UniversityModel.fromMap(Map<String, dynamic> map) {
    return UniversityModel(
      country: map['country'] ?? '',
      domains: List<String>.from(map['domains']),
      alpha_two_code: map['alpha_two_code'] ?? '',
      web_pages: List<String>.from(map['web_pages']),
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UniversityModel.fromJson(String source) => UniversityModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UniversityModel(country: $country, domains: $domains, alpha_two_code: $alpha_two_code, web_pages: $web_pages, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UniversityModel &&
      other.country == country &&
      listEquals(other.domains, domains) &&
      other.alpha_two_code == alpha_two_code &&
      listEquals(other.web_pages, web_pages) &&
      other.name == name;
  }

  @override
  int get hashCode {
    return country.hashCode ^
      domains.hashCode ^
      alpha_two_code.hashCode ^
      web_pages.hashCode ^
      name.hashCode;
  }
}