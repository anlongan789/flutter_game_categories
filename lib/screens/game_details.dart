// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_games_categories/models/game_model.dart';

import '../blocs/game_details/game_details_bloc.dart';
import '../widgets/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

class GameDetailsScreen extends StatelessWidget {
  final Game currentGame;

  const GameDetailsScreen({
    Key? key,
    required this.currentGame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var media = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => GameDetailsBloc(httpClient: http.Client())
        ..add(LoadGameDetails(id: currentGame.id!)),
      child: BlocBuilder<GameDetailsBloc, GameDetailsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text("Game details"),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: media.height > 750 && media.height < 1000 ? 30 : 0),
              child: GameCarousel(
                  imgList: currentGame.shortScreenshots ??
                      Game.games[0].shortScreenshots!),
            ),
            bottomSheet: BlocBuilder<GameDetailsBloc, GameDetailsState>(
              builder: (context, state) {
                switch (state.status) {
                  case GameDetailsStatus.failure:
                    return const Center(
                      child: Text("Cannot load game details!!!"),
                    );
                  case GameDetailsStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case GameDetailsStatus.success:
                    return Stack(
                      children: [
                        DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.6,
                          minChildSize: 0.6,
                          maxChildSize: 1,
                          builder: (BuildContext context,
                              ScrollController scrollController) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                color: theme.canvasColor,
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional.topCenter,
                                children: [
                                  Positioned(
                                    top: 10,
                                    child: Container(
                                      width: 30,
                                      height: 7,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 20),
                                    child: ListView(
                                      shrinkWrap: true,
                                      controller: scrollController,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  currentGame.name!,
                                                  style: theme
                                                      .textTheme.headlineSmall,
                                                ),
                                                Text("Action, Adventure")
                                              ],
                                            ),
                                            CircleAvatar(
                                              backgroundColor:
                                                  theme.primaryColor,
                                              child: IconButton(
                                                onPressed: () {
                                                  log("Favorite!!");
                                                },
                                                icon: Icon(
                                                  Icons.favorite_sharp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        GameBasicInfoCard(theme: theme),
                                        const SizedBox(height: 20),
                                        GameListImages(
                                            imgList:
                                                currentGame.shortScreenshots ??
                                                    Game.games[0]
                                                        .shortScreenshots!),
                                        Html(
                                            data:
                                                """<p>Marvel&#39;s Spider-Man offers the player to take on the role of the most famous Marvel superhero.</p>\n<h3>Plot</h3>\n<p>The game introduces Spider-Man as an already experienced superhero. By the time the game begins, Peter has captured the infamous Kingpin as well as several other supervillains. Now, a gang that goes by the name of Demons poses a new danger to New York. Meanwhile, Peter is working for the scientist Otto Octavius, who didn&#39;t yet become Dr. Octopus, on their science project. Throughout the game, Spidey has to deal with multiple enemies, such as Norman Osbourne, Electro, Vulture, Rhino and Kingpin, among others.</p>\n<h3>Gameplay</h3>\n<p>The player controls Peter Parker, aka Spider-Man, from the third person view. There are also sections of the game in which the player controls other protagonists, namely Mary Jane and Miles Morales. The game is set in a 3D environment that is modeled after New York City. The player can travel the city using web slings, running, jumping, and crawling the walls. The setting includes numerous high-rise buildings designed specifically for Spider-Man&#39;s movements.</p>\n<p>As the player progresses, he or she unlocks new suits that grant Spider-Man new abilities, such as additional attacks or enhanced Spider-Sense. The abilities are not tied to the suits, however, and the player can use the suit of his or her choice without losing the ability. The combat system is similar to that in Batman: Arkham, in that Spider-Man fights many opponents in hand-to-hand combat but avoids killing them.</p>""")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
