import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    required this.title,
    required this.chapter,
    Key? key,
  }) : super(key: key);
  final String title;
  final dynamic chapter;

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
              ),
              ListView.separated(
                shrinkWrap: false,
                physics: const ScrollPhysics(),
                itemCount: chapter['titles'].length,
                itemBuilder: (context, index) {
                  return InkWell(
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
