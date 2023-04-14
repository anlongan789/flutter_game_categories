import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_games_categories/models/game_model.dart';

class GameCarousel extends StatelessWidget {
  const GameCarousel({
    super.key,
    required this.imgList,
  });

  final List<ShortScreenshot> imgList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        // height: 200,
        aspectRatio: 19 / 11,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(milliseconds: 1200),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: imgList
          .map(
            (item) => Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(item.image ??
                            "https://www.charlotteathleticclub.com/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 5,
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide.none,
                    label: Text(
                      "Popular",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
