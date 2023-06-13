import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:etut_mobile/global/styles/styles.dart';
import 'package:etut_mobile/repository/dio_service.dart';
import 'package:flutter/material.dart';

class TalentsScreen extends StatefulWidget {
  const TalentsScreen({super.key});

  @override
  State<TalentsScreen> createState() => _TalentsScreenState();
}

class _TalentsScreenState extends State<TalentsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(children: [
          TabBar(
            controller: _tabController,
            isScrollable: false,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(
                text: 'Teachers',
              ),
              Tab(
                text: 'Students',
              ),
              Tab(
                text: 'Graduates',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              children: List.generate(
                  _tabController.length,
                  (index) => TabBodyScreen(
                        type: index,
                      )),
            ),
          ),
        ]),
      ),
    );
  }
}

class TabBodyScreen extends StatefulWidget {
  final int type;
  const TabBodyScreen({super.key, required this.type});

  @override
  State<TabBodyScreen> createState() => _TabBodyScreenState();
}

class _TabBodyScreenState extends State<TabBodyScreen> {
  List<dynamic> teachers = [];
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    if (widget.type == 0) {
      DioService().getTeachers().then((value) {
        setState(() {
          teachers = value ?? [];
          isLoaded = true;
        });
      });
    } else if (widget.type == 1) {
      DioService().getStudents().then((value) {
        setState(() {
          teachers = value ?? [];
          isLoaded = true;
        });
      });
    } else {
      DioService().getGraduates().then((value) {
        setState(() {
          teachers = value ?? [];
          isLoaded = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: GridView.builder(
          itemCount: teachers.length,
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300, mainAxisExtent: 250),
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: teachers[index]["src"] ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      left: 4,
                      right: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(42, 94, 148, 229),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color.fromARGB(125, 189, 189, 189),
                                width: 0.8,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(teachers[index]["name"] ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(teachers[index]["major"]["title"] ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
