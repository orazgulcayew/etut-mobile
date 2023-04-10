import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:etut_mobile/repository/models/news.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  final List<String> bannersUrls;
  const BannerSlider({super.key, required this.bannersUrls});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2,
        autoPlay: true,
      ),
      items: bannersUrls.map((item) {
        return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: item,
                fit: BoxFit.cover,
              ),
            ));
      }).toList(),
    );
  }
}

class NewsImageSlider extends StatefulWidget {
  final List<ImageFile> images;

  const NewsImageSlider({super.key, required this.images});

  @override
  State<NewsImageSlider> createState() => _NewsImageSliderState();
}

class _NewsImageSliderState extends State<NewsImageSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220,
            autoPlay: false,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widget.images.map((item) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: item.source,
                  fit: BoxFit.cover,
                ));
          }).toList(),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.transparent
                ])),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.images.asMap().entries.map((entry) {
                  return Container(
                    width: _current == entry.key ? 12 : 6,
                    height: 6.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
