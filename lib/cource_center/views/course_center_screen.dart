import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../repository/dio_service.dart';

class CourseCenterScreen extends StatefulWidget {
  const CourseCenterScreen({super.key});

  @override
  State<CourseCenterScreen> createState() => _CourseCenterScreenState();
}

class _CourseCenterScreenState extends State<CourseCenterScreen> {
  List<dynamic> items = [];
  List<dynamic> books = [];

  bool isLoaded = false;
  @override
  void initState() {
    super.initState();

    DioService().getCourses().then((value) {
      setState(() {
        items = value ?? [];
        isLoaded = true;
      });
    });
    DioService().getBooks().then((value) {
      setState(() {
        books = value ?? [];
        // isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (!isLoaded) const CircularProgressIndicator(),
            ...List.generate(
                items.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                  width: double.infinity,
                                  height: 240,
                                  fit: BoxFit.cover,
                                  imageUrl: items[index]["img"])),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 4),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(132, 9, 94, 221),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          125, 189, 189, 189),
                                      width: 0.8,
                                    ),
                                  ),
                                  child: Text(
                                    items[index]["title"],
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
            const Gap(12),
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Books",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
            const Gap(8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      books.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: books[index]["img"],
                                  height: 200,
                                  width: 140,
                                  fit: BoxFit.cover,
                                ),
                                OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.download),
                                    label: const Text("Download"))
                              ],
                            ),
                          ))
                ],
              ),
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
