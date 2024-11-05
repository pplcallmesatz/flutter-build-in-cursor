import 'package:flutter/material.dart';

class CustomRangeSlider extends StatelessWidget {
  final String label;
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;
  final double min;
  final double max;

  const CustomRangeSlider({
    Key? key,
    required this.label,
    required this.values,
    required this.onChanged,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF69646A),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFFFEF5FF),
            inactiveTrackColor: const Color(0xFFC0C0C0),
            trackHeight: 3,
            thumbColor: const Color(0xFFFEF5FF),
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 8,
              elevation: 4,
              pressedElevation: 6,
            ),
            overlayColor: const Color(0x24FEF5FF),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          ),
          child: RangeSlider(
            values: values,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${values.start.round()}',
              style: const TextStyle(fontSize: 12, color: Color(0xFF69646A)),
            ),
            Text(
              '${values.end.round()}',
              style: const TextStyle(fontSize: 12, color: Color(0xFF69646A)),
            ),
          ],
        ),
      ],
    );
  }
}
