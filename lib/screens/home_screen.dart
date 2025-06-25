import 'package:baby_name_app/controllers/controller.dart';
import 'package:baby_name_app/routes/route_names.dart';
import 'package:baby_name_app/shared_widget/filter_bottomsheet.dart';
import 'package:baby_name_app/shared_widget/search_shared_widget.dart';
import 'package:baby_name_app/shared_widget/shared_widget_for_text.dart';
import 'package:baby_name_app/utils/app_colors.dart';
import 'package:baby_name_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import '../models/baby_name_models.dart';
import '../shared_widget/bottomsheet.dart';
import '../shared_widget/drawer_shared_widget.dart';
import '../shared_widget/name_list_container.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../shared_widget/webview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<BabyNameModel> _list = [];
  List<BabyNameModel> filteredList = [];

  String selectedPage = '';
  String? selectedAlphabet;
  String? selectedGender;
  String? selectedReligion;

  @override
  void initState() {
    super.initState();
    getSelectedBaby();
    filteredList = _list;
  }

  void applyFilters(String? alphabet, String? gender, String? religion) {
    setState(() {
      // Filter from the full babyNameList based on the selected filters
      filteredList =
          AppControllers.babyNameList.where((item) {
            bool matchesAlphabet =
                alphabet == null || item.name.startsWith(alphabet);
            bool matchesGender =
                gender == null ||
                (gender == "Boy" && item.babyType == 1) ||
                (gender == "Girl" && item.babyType == 2) ||
                (gender == "Twin" && item.babyType == 3);
            bool matchesReligion =
                religion == null || item.religion == religion;
            return matchesAlphabet && matchesGender && matchesReligion;
          }).toList();
    });
  }

  void getSelectedBaby() {
    if (AppControllers.selectedBaby == 1) {
      _list =
          AppControllers.babyNameList
              .where(
                (e) =>
                    e.babyType == 1 &&
                    e.religion == AppControllers.selectedReligion,
              )
              .toList();
    } else if (AppControllers.selectedBaby == 2) {
      _list =
          AppControllers.babyNameList
              .where(
                (e) =>
                    e.babyType == 2 &&
                    e.religion == AppControllers.selectedReligion,
              )
              .toList();
    } else if (AppControllers.selectedBaby == 3) {
      _list =
          AppControllers.babyNameList
              .where(
                (e) =>
                    e.babyType == 3 &&
                    e.religion == AppControllers.selectedReligion,
              )
              .toList();
    }
    setState(() {
      filteredList = _list;
    });
  }

  void filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the search query is empty, show the full list based on the selected baby type
        getSelectedBaby();
      } else {
        // Filter from the full babyNameList based on the query
        filteredList =
            AppControllers.babyNameList
                .where(
                  (i) =>
                      i.name.toLowerCase().startsWith(query.toLowerCase()) &&
                      i.babyType == AppControllers.selectedBaby &&
                      i.religion == AppControllers.selectedReligion,
                )
                .toList();
      }
    });
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FilterBottomsheet(
          selectedAlphabet: selectedAlphabet,
          selectedGender: selectedGender,
          selectedReligion: selectedReligion,
        );
      },
    ).then((filters) {
      if (filters != null) {
        setState(() {
          selectedAlphabet = filters['alphabet'];
          selectedGender = filters['gender'];
          selectedReligion = filters['religion'];
        });
        applyFilters(
          filters['alphabet'],
          filters['gender'],
          filters['religion'],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.bgcolor,
        title:
            AppControllers.selectedBaby == 1
                ? SharedWidgetForText(text: "Boy Names")
                : (AppControllers.selectedBaby == 2
                    ? SharedWidgetForText(text: "Girl Names")
                    : SharedWidgetForText(text: "Twin Baby Names")),
        actions: [
          IconButton(
            onPressed: _showFilterBottomSheet,
            icon: Image.asset(AppImages.filter, scale: 1),
          ),
        ],
      ),

      drawer: DrawerSharedWidget(
        onTapRateUs: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WebViewScreen(
                url: "https://flutter.dev/", // Replace with your actual app link
                title: "Rate Us",
              ),
            ),
          );
        },
        onTapAbtUs: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WebViewScreen(
              url: "https://flutter.dev/", // Replace with your actual app link
              title: "About Us",
            ),
          ),
        );
        },
        onTapFeedback: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WebViewScreen(
                url: "https://flutter.dev/", // Replace with your actual app link
                title: "Feedback",
              ),
            ),
          );
        },
        onTapShareApp: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WebViewScreen(
                url: "https://flutter.dev/", // Replace with your actual app link
                title: "Share App",
              ),
            ),
          );
        },
        onTapPP: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WebViewScreen(
                url: "https://flutter.dev/", // Replace with your actual app link
                title: "Privacy Policy",
              ),
            ),
          );
        },
        onTapTC: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WebViewScreen(
                url: "https://flutter.dev/", // Replace with your actual app link
                title: "Terms & Conditions",
              ),
            ),
          );
        },
      ),
      body: Column(
        children: [
          // Top Section with Search
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.bgcolor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer(); // Open the drawer
                        },
                        child: Image.asset(AppImages.settings, scale: 4),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.favouriteScreen,
                          );
                        },
                        child: Image.asset(AppImages.fav, scale: 4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SharedWidgetForText(text: "Explore a World of"),
                  SharedWidgetForText(text: "Beautiful Baby Names"),
                  const SizedBox(height: 20),
                  SearchSharedWidget(onSearch: filterSearchResults),
                ],
              ),
            ),
          ),

          // List of Names
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final nameModel = filteredList[index];

                if (AppControllers.selectedBaby == 3) {
                  // Twin Baby Layout
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.yellow,
                    ),
                    child: Column(
                      children: [
                        NameCard(
                          name: nameModel.name,
                          meaning: nameModel.nameMeaning,
                          imagePath:
                              nameModel.twinType == "boys"
                                  ? AppImages.male
                                  : nameModel.twinType == "girls"
                                  ? AppImages.female
                                  : AppImages.male,
                          backgroundColor: AppColor.yellow,
                          onVolumeTap: () {},
                          onMoreTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              builder: (context) {
                                return Bottomsheet(nameModel: nameModel);
                              },
                            ).then((_){
                              FocusScope.of(context).unfocus();

                            });
                          },
                        ),
                        NameCard(
                          name: nameModel.name2 ?? '',
                          meaning: nameModel.nameMeaning2 ?? '',
                          imagePath:
                              nameModel.twinType == "boys"
                                  ? AppImages.male
                                  : nameModel.twinType == "girls"
                                  ? AppImages.female
                                  : AppImages.female,
                          backgroundColor: AppColor.yellow,
                          onVolumeTap: () {},
                          onMoreTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              builder: (context) {
                                return Bottomsheet(nameModel: nameModel);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  // Single Baby Layout
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: NameCard(
                      name: nameModel.name,
                      meaning: nameModel.nameMeaning,
                      imagePath:
                          AppControllers.selectedBaby == 1
                              ? AppImages.male
                              : AppImages.female,
                      backgroundColor: AppColor.yellow,
                      onVolumeTap: () {},
                      onMoreTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) {
                            return Bottomsheet(nameModel: nameModel);
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
