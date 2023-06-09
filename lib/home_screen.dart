import 'dart:convert';

import 'package:flutter/material.dart';

import 'data.dart';
import 'second_screen.dart';

/// The Home class is a StatefulWidget that contains a decoded JSON data object.
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  /// `final data = json.decode(json.encode(Data.data));` is decoding a JSON object stored in the `Data`
  /// class, then encoding it again and storing the result in the `data` variable. This is done to
  /// create a deep copy of the original JSON object, as decoding and encoding a JSON object creates a
  /// new object with the same values as the original. This ensures that any modifications made to the
  /// `data` variable will not affect the original JSON object stored in the `Data` class.
  final data = json.decode(json.encode(Data.data));

  /// This is a factory method that creates and returns a new instance of the _HomeState class.
  @override
  State<Home> createState() => _HomeState();
}

/// The `_HomeState` class builds a SafeArea Scaffold with an AppBar and a Stack containing a background
/// and a listView aligned to the center, and handles different actions based on the index
/// parameter passed to it.
class _HomeState extends State<Home> {
  /// This function builds a SafeArea Scaffold with an AppBar and a Stack containing a background and a
  /// listView aligned to the center.
  ///
  /// Args:
  ///   context (BuildContext): The BuildContext is a handle to the location of a widget in the widget
  /// tree. It is used by the framework to locate and update the widget. It is passed as a parameter to
  /// the build() method of a widget.
  ///
  /// Returns:
  ///   A `SafeArea` widget containing a `Scaffold` widget with an `AppBar` and a `Stack` widget as its
  /// body. The `Stack` widget has two children, a `background` widget and a `listView` widget.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text("فلسفه ی علم ریاضی"),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            background(),
            listView(),
          ],
        ),
      ),
    );
  }

  /// This function returns a container with a background image and a white color filter applied to it.
  background() {
    return Container(
      alignment: Alignment.center,
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/png/shahed_logo.png'),
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.4),
            BlendMode.modulate,
          ),
        ),
      ),
    );
  }

  /// This function creates a ListView widget with separated items and a custom onTap function.
  ///
  /// Returns:
  ///   A ListView widget with separated items, each containing an InkWell widget with a custom border
  /// and a Text widget displaying a title from the 'titles' list in the widget's data. The ListView has
  /// a specified itemCount and itemBuilder function, as well as a separatorBuilder function to add a
  /// Divider between each item. The ListView also has a specified padding and scroll physics. The
  /// function does not explicitly return anything, but
  listView() {
    return ListView.separated(
      shrinkWrap: false,
      physics: const ScrollPhysics(),
      itemCount: widget.data['titles'].length,
      itemBuilder: (context, index) {
        return InkWell(
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: () => clickHandler(index),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.data['titles'][index],
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
      padding: const EdgeInsets.all(8.0),
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  /// The function handles different actions based on the index parameter passed to it, such as showing
  /// a modal bottom sheet or navigating to a new screen.
  ///
  /// Args:
  ///   index: The index parameter is an integer value that is used to determine which action to take in
  /// the switch statement. It is passed as an argument to the clickHandler function.
  ///
  /// Returns:
  ///   The `clickHandler` function is not returning anything. It is a void function that is used to
  /// handle different actions based on the value of the `index` parameter passed to it.
  clickHandler(index) {
    switch (index) {
      case 0:
        showModalBottomSheet(
          useSafeArea: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  widget.data['abstract'].toString(),
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
        );
        break;
      case 1:
        showModalBottomSheet(
          useSafeArea: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Text(
                    widget.data['introduction'].toString(),
                    // textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            );
          },
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: SecondScreen(
                title: widget.data['titles'][index],
                chapter: widget.data['chapters'][0],
              ),
            ),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: SecondScreen(
                title: widget.data['titles'][index],
                chapter: widget.data['chapters'][1],
              ),
            ),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: SecondScreen(
                title: widget.data['titles'][index],
                chapter: widget.data['chapters'][2],
              ),
            ),
          ),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: SecondScreen(
                title: widget.data['titles'][index],
                chapter: widget.data['chapters'][3],
              ),
            ),
          ),
        );
        break;
      case 6:
        showModalBottomSheet(
          useSafeArea: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.separated(
                  shrinkWrap: false,
                  physics: const ScrollPhysics(),
                  itemCount: widget.data['sourcesAndCollectors'].length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.data['sourcesAndCollectors'][index],
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            );
          },
        );
        break;
    }
  }
}
