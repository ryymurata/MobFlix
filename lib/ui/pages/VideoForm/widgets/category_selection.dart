import 'package:flutter/material.dart';

class CategorySelection extends StatelessWidget {
  final String dropDownValue;
  final List<String> categories;
  final void Function(String?)? onChanged;
  const CategorySelection(
      {super.key,
      required this.dropDownValue,
      required this.categories,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          validator: _validateCategorySelected,
          value: dropDownValue,
          isExpanded: true,
          dropdownColor: const Color(0xFF275FA3),
          style: const TextStyle(color: Colors.white),
          items: categories
              .map((String value) =>
                  DropdownMenuItem(value: value, child: Text(value)))
              .toList(),
          onChanged: onChanged,
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
