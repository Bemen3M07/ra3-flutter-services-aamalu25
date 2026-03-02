import 'package:http/http.dart' as http;
import 'package:flutter_hello_world/models/car_model.dart';

class CarHttpService { // Nombre actualizado
  final String _baseUrl = "car-data.p.rapidapi.com";
  final String _apiKey = "946c94dc4emshb816ec7dc2c692bp1990a7jsnfc81b9415071"; 
  final String _apiHost = "car-data.p.rapidapi.com";

  Future<List<CarModel>> getCars() async {
    // IMPORTANTE: El test pide 10 elementos, ponemos limit=10
    final url = Uri.https(_baseUrl, '/cars', {'limit': '10'});

    final response = await http.get(url, headers: {
      'X-RapidAPI-Key': _apiKey,
      'X-RapidAPI-Host': _apiHost,
    });

    if (response.statusCode == 200) {
      return carModelFromJson(response.body);
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }
}