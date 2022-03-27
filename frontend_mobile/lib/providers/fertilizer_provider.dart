import 'dart:convert';
import 'dart:io';

import 'package:frontend_mobile/exceptions/Exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Fertilizer with ChangeNotifier {
  final String id;
  final String name;
  final String code;
  final String weight;
  final String description;

  Fertilizer(
    this.id,
    this.name,
    this.code,
    this.weight,
    this.description,
  );
}

class Fertilizers with ChangeNotifier {
  List<Fertilizer> _fertilizers = [];

  List<Fertilizer> getFertilizers() {
    return _fertilizers;
  }

  Future<void> fetchFertilizers() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8070/fertilizer/GetAllFertilizer'),
      );
      switch (response.statusCode) {
        case 200:
          final extractedCode = json.decode(response.body) as List<dynamic>;
          final List<Fertilizer> loadedFertilizers = [];
          extractedCode.forEach(
            (prodData) {
              loadedFertilizers.add(
                Fertilizer(
                  prodData['_id'],
                  prodData['fertilizer_Name'],
                  prodData['fertilizer_code'],
                  prodData['weight'],
                  prodData['description'],
                ),
              );
            },
          );
          _fertilizers = loadedFertilizers;
          notifyListeners();
      }
      notifyListeners();
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<int> createFertilizer(
    name,
    code,
    weight,
    description,
  ) async {
    Map<String, dynamic> _body = {
      "fertilizer_Name": name,
      "fertilizer_code": code,
      "weight": weight,
      "description": description,
    };

    final encodedData = json.encode(_body);

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8070/fertilizer/add'),
        body: encodedData,
      );
      switch (response.statusCode) {
        case 201:
          return 0;
        case 400:
          throw BadRequestException(
              'Seems something went wrong. Try again later');
        default:
          throw FetchDataException(' ' + response.statusCode.toString());
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<int> updateFertilizer(
    id,
    name,
    code,
    weight,
    description,
  ) async {
    Map<String, dynamic> _body = {
      "fertilizer_Name": name,
      "fertilizer_code": code,
      "weight": weight,
      "description": description,
    };

    final encodedData = json.encode(_body);

    try {
      final response = await http.put(
        Uri.parse('http://10.0.2.2:8070/fertilizer/UpdateData/$id'),
        body: encodedData,
      );
      switch (response.statusCode) {
        case 201:
          return 0;
        case 400:
          throw BadRequestException(
              'Seems something went wrong. Try again later');
        default:
          throw FetchDataException(' ' + response.statusCode.toString());
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<void> deleteFertilizer(id) async {
    try {
      final response = await http.delete(
        Uri.parse('http://10.0.2.2:8070/fertilizer/Delete/$id'),
      );
      switch (response.statusCode) {
        case 200:
          notifyListeners();
      }
      notifyListeners();
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}
