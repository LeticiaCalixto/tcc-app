import 'package:flutter/material.dart';

class DropDownMenuButton extends StatefulWidget {
  const DropDownMenuButton({
    super.key,
    required this.items,
  });

  final List<dynamic> items;

  @override
  State<DropDownMenuButton> createState() => _DropDownMenuButtonState();
}

class _DropDownMenuButtonState extends State<DropDownMenuButton> {
  late String _currentValue;

  @override
  initState() {
    super.initState();
    _currentValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _currentValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      underline: Container(
        height: 2,
        color: const Color(0xFF0047FF),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          _currentValue = value!;
        });
      },
      items: widget.items
          .map<DropdownMenuItem<String>>(
            (dynamic value) => DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                width: 290,
                child: Text(value),
              ),
            ),
          )
          .toList(),
    );
  }
}
