// class AddSensorsMenu extends StatefulWidget {
//   late List<SensorEntity>? sensors,

//   const AddSensorsMenu({
//     Key? key,
//     required this.items,
//   }) : super(key: key);

//   final List<dynamic> items;

//   @override
//   State<AddSensorsMenu> createState() => _AddSensorsMenuState();

//   showAddModal(
//     BuildContext context, {
//     required List<SensorEntity>? sensors,
//   }) {
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
//               DropDownMenuButton(items: [
//                 sensors,
//               ]),
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
//                           label: Text('Temperatura Minima')),
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
//                       onPressed: () {
//                         //TODO: Implementar adição
//                       },
//                       child: Text(confirmationButton)),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }