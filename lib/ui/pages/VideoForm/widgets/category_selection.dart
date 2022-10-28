import 'package:flutter/material.dart';

class CategorySelection extends StatefulWidget {
  final String dropDownValue;
  final List<String> categories;
  final void Function(String?)? onChanged;

  const CategorySelection(
      {super.key,
      required this.dropDownValue,
      required this.categories,
      required this.onChanged});

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF275FA3),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField(
            validator: _validateCategorySelected,
            value: widget.dropDownValue,
            isExpanded: true,
            items: widget.categories
                .map((String value) =>
                    DropdownMenuItem(value: value, child: Text(value)))
                .toList(),
            onChanged: widget.onChanged,
            dropdownColor: const Color(0xFF275FA3),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  String? _validateCategorySelected(value) {
    return value == "Selecione uma Categoria"
        ? 'Selecione uma categoria válida'
        : null;
  }
}
