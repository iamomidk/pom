import 'dart:convert';

import 'package:flutter/material.dart';

import 'data.dart';
import 'second_screen.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  final data = json.decode(json.encode(Data.data));

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text("فلسفه ی علم ریاضی"),
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
              itemCount: widget.data['titles'].length,
              itemBuilder: (context, index) {
                return InkWell(
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onTap: () {
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
                                  itemCount:
                                      widget.data['sourcesAndCollectors'].length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        widget.data['sourcesAndCollectors']
                                            [index],
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(),
                                ),
                              ),
                            );
                          },
                        );
                        break;
                    }
                  },
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
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          ],
        ),
      ),
    );
  }
}
