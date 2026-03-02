import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hello_world/services/car_service.dart';

void main() {
  group('CarsApi', () {
    test('get cars', () async {
      print('--- INICIANDO TEST DE CONEXIÓN ---');
      
      final carHttpService = CarHttpService();
      
      try {
        final cars = await carHttpService.getCars();
        
        // Prints informativos para el vídeo/memoria
        print('Conexión exitosa');
        print(' Cantidad de coches recibidos: ${cars.length}');
        
        if (cars.isNotEmpty) {
          print(' Primer coche detectado: [ID: ${cars[0].id}] ${cars[0].make} ${cars[0].model}');
          print(' Último coche detectado: [ID: ${cars[9].id}] ${cars[9].make} ${cars[9].model}');
        }

        // Validaciones del ejercicio
        expect(cars.length, 10);
        expect(cars[0].id, 9582);
        expect(cars[9].id, 9591);
        
        print('--- TEST FINALIZADO CON ÉXITO ---');
        
      } catch (e) {
        print(' ERROR DURANTE EL TEST: $e');
        // Re-lanzamos el error para que el test falle oficialmente
        rethrow; 
      }
    });
  });
}