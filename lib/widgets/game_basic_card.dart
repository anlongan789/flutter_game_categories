import 'package:flutter/material.dart';

class GameBasicInfoCard extends StatelessWidget {
  const GameBasicInfoCard({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: theme.scaffoldBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Rating
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_border_outlined,
                color: theme.primaryColor,
              ),
              const SizedBox(height: 5),
              Text("4.5"),
            ],
          ),

          //Downloads
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.download_for_offline_outlined,
                color: theme.primaryColor,
              ),
              const SizedBox(height: 5),
              Text("4M+"),
            ],
          ),

          //Storage size
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.storage_outlined,
                color: theme.primaryColor,
              ),
              const SizedBox(height: 5),
              Text("62GB"),
            ],
          ),

          //Genres
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.category_outlined,
                color: theme.primaryColor,
              ),
              const SizedBox(height: 5),
              Text("Action"),
            ],
          ),
        ],
      ),
    );
  }
}
