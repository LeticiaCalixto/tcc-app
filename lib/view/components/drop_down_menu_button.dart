import 'package:flutter/material.dart';

class DropDownMenuButton<T> extends StatefulWidget {
  const DropDownMenuButton({
    Key? key,
    required this.itemBuilder,
    required this.items,
  }) : super(key: key);

  final List<T> items;
  final Widget Function(T) itemBuilder;

  @override
  State<DropDownMenuButton<T>> createState() => _DropDownMenuButtonState<T>();
}

class _DropDownMenuButtonState<T> extends State<DropDownMenuButton<T>> {
  late T _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: _currentValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      underline: Container(
        height: 2,
        color: const Color(0xFF0047FF),
      ),
      onChanged: (value) {
        // This is called when the user selects an item.
        setState(() {
          _currentValue = value ?? widget.items.first;
        });
      },
      items: widget.items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: widget.itemBuilder(value),
        );
      }).toList(),
    );
  }
}