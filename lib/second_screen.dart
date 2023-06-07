import 'package:flutter/material.dart';

/// The `SecondScreen` class is a stateless widget that displays a scaffold with a background image and
/// a ListView of titles and sub-titles that show a modal bottom sheet when tapped.
class SecondScreen extends StatelessWidget {
  const SecondScreen({
    required this.title,
    required this.chapter,
    Key? key,
  }) : super(key: key);

  /// `final String title;` is declaring a final variable `title` of type `String` in the `SecondScreen`
  /// class. This variable is required and needs to be provided when creating an instance of the
  /// `SecondScreen` class.
  final String title;

  /// `final dynamic chapter;` is declaring a final variable `chapter` of type `dynamic` in the
  /// `SecondScreen` class. This variable is required and needs to be provided when creating an instance
  /// of the `SecondScreen` class. The `dynamic` type means that the variable can hold any type of data.
  /// In this case, it is expected that `chapter` will hold a Map with keys 'titles' and 'subTitles', as
  /// seen in the `ListView.separated` widget where `chapter['titles'].length` and
  /// `chapter['subTitles'][index]` are used.
  final dynamic chapter;

  /// This function builds a scaffold with a titled app bar and a safe area containing a list view with
  /// right-to-left text direction.
  ///
  /// Args:
  ///   context (BuildContext): The BuildContext is a handle to the location of a widget in the widget
  /// tree. It is used by the framework to locate and update the widget in the tree. It is passed as a
  /// parameter to the build() method of a widget.
  ///
  /// Returns:
  ///   A widget tree is being returned, starting with a `Directionality` widget that sets the text
  /// direction to right-to-left, followed by a `SafeArea` widget that ensures the content is displayed
  /// within the safe area of the device, and a `Scaffold` widget that provides a basic structure for
  /// the screen, including an `AppBar` and a `body` that contains a `listView`.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            title: Text(title),
          ),
          body: listView(),
        ),
      ),
    );
  }

  /// This function creates a ListView with separated items that display titles and sub-titles, and when
  /// tapped, show a modal bottom sheet with the corresponding sub-title.
  ///
  /// Returns:
  ///   A ListView widget with separated items, each containing a title and a subtitle. When a title is
  /// tapped, a modal bottom sheet is displayed with the corresponding subtitle.
  listView() {
    ListView.separated(
      shrinkWrap: false,
      physics: const ScrollPhysics(),
      itemCount: chapter['titles'].length,
      itemBuilder: (context, index) {
        return InkWell(
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: () {
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
                        chapter['subTitles'][index],
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
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              chapter['titles'][index],
              style: const TextStyle(),
            ),
          ),
        );
      },
      padding: const EdgeInsets.all(8.0),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
