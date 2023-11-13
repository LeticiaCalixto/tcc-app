import 'package:tcc_app/models/sensor.dart';
import 'package:tcc_app/service/list_sensor.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MockCollectionReference extends Mock implements CollectionReference {}

class MockQuerySnapshot extends Mock implements QuerySnapshot<Map<String, dynamic>> {}

class MockQueryDocumentSnapshot extends Mock implements QueryDocumentSnapshot<Map<String, dynamic>> {}

void main() {
  group('fetchSensors', () {
    test('returns a list of SensorEntity', () async {
      final mockCollectionReference = MockCollectionReference();
      final mockQuerySnapshot = MockQuerySnapshot();
      final mockDocumentSnapshot = MockQueryDocumentSnapshot();

      when(mockCollectionReference.get())
          .thenAnswer((_) async => mockQuerySnapshot);

      when(mockDocumentSnapshot.data()).thenReturn({
        'field1': 'value1',
        'field2': 'value2',
        // Adicione mais campos com base no construtor SensorEntity.fromMap
      });

      when(mockQuerySnapshot.docs).thenReturn([mockDocumentSnapshot]);

      final result = await fetchSensors(emailResponsible: 'test@example.com');

      expect(result, isA<List<SensorEntity>>());
    });

    // Adicione mais casos de teste para cobrir diferentes cenários, por exemplo, resultado vazio, tratamento de erros, etc.
  });
}
