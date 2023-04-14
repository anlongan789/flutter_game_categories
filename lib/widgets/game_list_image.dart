import 'package:flutter/material.dart';
import 'package:flutter_games_categories/models/game_model.dart';

class GameListImages extends StatelessWidget {
  const GameListImages({
    super.key,
    required this.imgList,
  });

  final List<ShortScreenshot> imgList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: imgList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                height: 130,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imgList[index].image ??
                        "https://www.charlotteathleticclub.com/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png"),
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          );
        },
      ),
    );
  }
}
