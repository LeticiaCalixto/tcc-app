// import 'package:flutter/material.dart';
// import 'package:tcc_app/models/sensor.dart';

// class AddSensorsMenu extends StatefulWidget {
//   final List<SensorEntity>? sensors;

//   const AddSensorsMenu({
//     Key? key,
//     required this.sensors,
//   }) : super(key: key);

//   @override
//   State<AddSensorsMenu> createState() => _AddSensorsMenuState();
// }

// class _AddSensorsMenuState extends State<AddSensorsMenu> {
//   String? selectedSensor;

//   void _showAddModal(BuildContext context) {
//     String title = 'Adicionar Sensor';
//     String confirmationButton = 'Salvar';
//     String skipButton = 'Cancelar';

//     TextEditingController descriptionController = TextEditingController();
//     TextEditingController tempMinController = TextEditingController();
//     TextEditingController tempMaxController = TextEditingController();

//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(24),
//         ),
//       ),
//       builder: (context) {
//         return Container(
//           height: MediaQuery.of(context).size.height,
//           padding: const EdgeInsets.all(32.0),
//           child: ListView(
//             children: [
//               Text(title, style: Theme.of(context).textTheme.headline5),
//               const SizedBox(
//                 height: 16,
//               ),
//               DropdownButton<String>(
//                 items: widget.sensors?.map((sensor) {
//                   return DropdownMenuItem<String>(
//                     value: sensor.name,
//                     child: Text(sensor.name),
//                   );
//                 }).toList(),
//                 onChanged: (String? value) {
//                   setState(() {
//                     selectedSensor = value;
//                   });
//                 },
//                 value: selectedSensor,
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               TextFormField(
//                 controller: descriptionController,
//                 decoration: const InputDecoration(label: Text('Descrição')),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 140,
//                     child: TextFormField(
//                       controller: tempMinController,
//                       decoration: const InputDecoration(
//                           label: Text('Temperatura Mínima')),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 40,
//                   ),
//                   SizedBox(
//                     width: 140,
//                     child: TextFormField(
//                       controller: tempMaxController,
//                       decoration: const InputDecoration(
//                           label: Text('Temperatura Máxima')),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(skipButton),
//                   ),
//                   const SizedBox(
//                     width: 16,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Implemente a lógica para adição
//                       // Use os controladores descriptionController, tempMinController, tempMaxController
//                       // E a variável selectedSensor, se aplicável
//                     },
//                     child: Text(confirmationButton),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
