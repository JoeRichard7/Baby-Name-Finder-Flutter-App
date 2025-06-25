import 'package:baby_name_app/shared_widget/shared_widget_for_text.dart';
import 'package:baby_name_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FilterBottomsheet extends StatefulWidget {
  final String? selectedAlphabet;
  final String? selectedGender;
  final String? selectedReligion;

  const FilterBottomsheet({
    super.key,
    this.selectedAlphabet,
    this.selectedGender,
    this.selectedReligion,
  });

  @override
  State<FilterBottomsheet> createState() => _FilterBottomsheetState();
}

class _FilterBottomsheetState extends State<FilterBottomsheet> {
  String? selectedAlphabet;
  String? selectedGender;
  String? selectedReligion;

  final List<String> alphabets = List.generate(26, (index) => String.fromCharCode(65 + index)); // A-Z
  final List<String> genders = ['Boy', 'Girl', 'Twin'];
  final List<String> religions = ['Christianity', 'Islam', 'Hinduism', 'Buddhism', 'Judaism', 'Sikhism', 'Jainism', 'Zoroastrianism'];

  @override
  void initState() {
    super.initState();
    selectedAlphabet = widget.selectedAlphabet;
    selectedGender = widget.selectedGender;
    selectedReligion = widget.selectedReligion;
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SharedWidgetForText(
            text: "Filter",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 16),

          // Alphabet Section
          _buildSection(
            title: "Alphabets",
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: alphabets.map((letter) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAlphabet = letter;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: selectedAlphabet == letter ? Colors.green[700] : Colors.green[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      letter,
                      style: TextStyle(
                        color: selectedAlphabet == letter ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 16),

          // Gender Section
          _buildSection(
            title: "Gender",
            child: Column(
              children: genders.map((gender) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = gender;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: selectedGender == gender ? Colors.green[700] : Colors.green[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      gender,
                      style: TextStyle(
                        color: selectedGender == gender ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 16),

          // Religion Section
          _buildSection(
            title: "Religion",
            child: Column(
              children: religions.map((religion) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedReligion = religion;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: selectedReligion == religion ? Colors.green[700] : Colors.green[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      religion,
                      style: TextStyle(
                        color: selectedReligion == religion ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 20),

          // Reset and Continue Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedAlphabet = null;
                      selectedGender = null;
                      selectedReligion = null;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.grey, // Button color (black)
                  ),
                  child: const Text("Reset", style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      "alphabet": selectedAlphabet,
                      "gender": selectedGender,
                      "religion": selectedReligion,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button color (black)
                  ),
                  child: const Text("Continue",style: TextStyle(color: Colors.white),),
                ),

              ),
            ],
          ),
        ],
      ),
    );
  }
}