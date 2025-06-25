// search_shared_widget.dart

import 'package:baby_name_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchSharedWidget extends StatelessWidget {
  final Function(String) onSearch;  // Accepts a function to handle search

  const SearchSharedWidget({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        onChanged: onSearch,  // Calls the search function whenever input changes
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: 'Search names by letters, words, etc.',
          suffixIcon: GestureDetector(
            child: Container(
              height: 55,
              width: 50,
              decoration: BoxDecoration(
                color: AppColor.bgcolor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.search_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}