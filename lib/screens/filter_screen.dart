import 'package:flutter/material.dart';
import '../widgets/custom_radio_button.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/custom_range_slider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String maritalStatus = ''; // Initialize with an empty string
  RangeValues ageRange = const RangeValues(18, 45);
  TextEditingController heightRangeController = TextEditingController();
  String? motherTongue;
  String? language;
  String physicalStatus = ''; // Initialize with an empty string

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Filters'),
        actions: [
          TextButton(
            onPressed: () {
              // Clear filters logic
            },
            child: const Text('Clear filters'),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: const Color(0x24887F7F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic preference',
              style: TextStyle(
                color: Color(0xFF2D282E),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            CustomRadioButton<String>(
              label: 'Marital Status',
              value: maritalStatus,
              groupValue: maritalStatus,
              onChanged: (value) => setState(() => maritalStatus = value ?? ''),
              options: [
                'Never married',
                'Waiting for divorcee',
                'Divorcee',
                'Widower',
                'Any',
              ],
            ),
            const SizedBox(height: 16),
            CustomRangeSlider(
              label: 'Age range (years)',
              values: ageRange,
              onChanged: (values) => setState(() => ageRange = values),
              min: 18,
              max: 45,
            ),
            const SizedBox(height: 16),
            CustomInputField(
              label: 'Height range',
              placeholder: 'Select height range',
              controller: heightRangeController,
            ),
            const SizedBox(height: 16),
            CustomDropdown<String>(
              label: 'Mother tongue',
              placeholder: 'Select mother tongue',
              value: motherTongue,
              items: ['Tamil', 'English', 'Hindi', 'Telugu', 'Malayalam']
                  .map((lang) => DropdownMenuItem(value: lang, child: Text(lang)))
                  .toList(),
              onChanged: (value) => setState(() => motherTongue = value),
            ),
            const SizedBox(height: 16),
            CustomDropdown<String>(
              label: 'Language',
              placeholder: 'Select language',
              value: language,
              items: ['Tamil', 'English', 'Hindi', 'Telugu', 'Malayalam']
                  .map((lang) => DropdownMenuItem(value: lang, child: Text(lang)))
                  .toList(),
              onChanged: (value) => setState(() => language = value),
            ),
            const SizedBox(height: 16),
            CustomRadioButton<String>(
              label: 'Physical status',
              value: physicalStatus,
              groupValue: physicalStatus,
              onChanged: (value) => setState(() => physicalStatus = value ?? ''),
              options: ['Normal', 'Physically challenged', 'Any'], // Add this line
            ),
          ],
        ),
      ),
    );
  }
}
