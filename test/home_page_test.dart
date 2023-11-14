// import 'package:tcc_app/models/sensor.dart';
// import 'package:tcc_app/service/list_sensor.dart';
// import 'package:test/test.dart';

// void main() {
//   test('Teste fetchSensors', () async {
//     // Cria um mock do Firestore
//     MockFirestoreInstance mockFirestore = MockFirestoreInstance();

//     // Adiciona dados fictícios ao Firestore
//     await mockFirestore.collection('sensors').add({
//       'responsible': 'test@example.com',
//       // Adicione aqui outros campos necessários para o SensorEntity
//     });

//     // Chama a função fetchSensors
//     List<SensorEntity> sensors = await fetchSensors(
//       firestore: mockFirestore,
//       emailResponsible: 'test@example.com',
//     );

//     // Verifica se os sensores foram buscados corretamente
//     expect(sensors, isNotEmpty);
//     expect(sensors[0].responsible, 'test@example.com');
//     // Adicione aqui outros asserts conforme necessário
//   });
// }