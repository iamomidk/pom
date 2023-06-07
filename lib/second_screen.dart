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

  /// This function builds a scaffold with a background and a list view, wrapped in a safe area and a
  /// right-to-left directionality.
  ///
  /// Args:
  ///   context (BuildContext): The BuildContext is a handle to the location of a widget in the widget
  /// tree. It is used by the framework to locate and update the widget. It is passed as a parameter to
  /// the build() method of a widget.
  ///
  /// Returns:
  ///   A widget tree is being returned, starting with a `Directionality` widget, followed by a
  /// `SafeArea` widget, which contains a `Scaffold` widget. The `Scaffold` widget has an `AppBar` and a
  /// `Stack` as its children. The `Stack` has two children, a `background` widget and a `listView`
  /// widget.
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
          body: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              background(),
              listView(),
            ],
          ),
        ),
      ),
    );
  }

  /// This function returns a container with a background image and a white color filter applied to it.
  background() {
    Container(
      alignment: Alignment.bottomLeft,
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
