// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_games_categories/models/game_model.dart';
import 'package:flutter_games_categories/screens/game_details.dart';
import 'package:go_router/go_router.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log("Spider Cop");
        // String location =
        //     context.namedLocation("details", params: {"game": game.toString()});
        // log(location);
        context.goNamed("details", extra: game, params: {"gameId": game.id});
      },
      child: Container(
        height: 230,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(game.backgroundImage),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://wallpaperaccess.com/full/2455735.jpg"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          game.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text("Action, Adventure"),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber[300],
                            ),
                            const SizedBox(width: 5),
                            Text("${game.rating} "),
                            Text(
                              "Rating",
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
