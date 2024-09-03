import 'package:flutter/material.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      selected: isSelected,
      onSelected: (bool selected) {
        onSelected();
      },
      backgroundColor: const Color(0xFF333333),
      selectedColor: Colors.blue,
      checkmarkColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: const BorderSide(
          color: Color(0xFF444444),
          width: 1.0,
        ),
      ),
    );
  }
}