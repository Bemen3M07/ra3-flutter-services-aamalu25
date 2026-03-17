import 'package:http/http.dart' as http;
import '../models/carsmodel.dart';

class CarHttpService {
  // Datos extraídos de la documentación de la API y probados en Postman
  final String _serverUrl = "https://car-data.p.rapidapi.com";
  final String _headerKey = "7c00063cc0mshd06eb3f7234b024p167924jsn67c78b190f6a";
  final String _headerHost = "car-data.p.rapidapi.com";
  Future<List<CarsModel>> getCars() async {
    // 1. Construimos la URI completa
    var uri = Uri.parse("$_serverUrl/cars");
    
    //  Realizamos la llamada GET con las cabeceras necesarias
    var response = await http.get(uri, headers: {
      "x-rapidapi-key": _headerKey,
      "x-rapidapi-host": _headerHost,
    });

    // Verificamos el código de estado 
    if (response.statusCode == 200) {
      // Usamos la función que creamos en el modelo para transformar el cuerpo del JSON
      return carsModelFromJson(response.body);
    } else {
      // Si falla, lanzamos una excepción con el error
      throw ("Error al obtener la lista de coches: ${response.statusCode}");
    }
  }
}