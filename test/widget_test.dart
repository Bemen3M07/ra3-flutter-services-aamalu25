//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//import 'package:flutter_hello_world/main.dart';
import 'package:flutter_hello_world/services/car_http_service.dart';
import 'package:flutter_hello_world/models/carsmodel.dart';

void main() {
  // Agrupamos los tests relacionados con el servicio de coches
  group('Pruebas del Servicio de Coches (Ejercicio 1)', () {
    
    test('Debe retornar una lista de 10 coches desde la API - GETCARS', () async {
      // Instanciamos el servicio
      final carService = CarHttpService();

      // Ejecutamos la petición
      final cars = await carService.getCars();

      // Verificaciones (Expects)
      expect(cars.length, 10); // ¿Tiene 10 elementos?
      expect(cars, isA<List<CarsModel>>()); // ¿Es una lista de nuestro modelo?
      expect(cars[0].id, 9582); // ¿El primer coche tiene un ID? 
      expect(cars[9].id, 9591); // ¿El último coche tiene un ID?

      //imprimir el modelo del primer coche para verlo en consola
      print('Prueba superada. Primer coche encontrado: ${cars[0].make} ${cars[0].model}');
    });
  });
}
