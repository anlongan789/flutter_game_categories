import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_games_categories/models/game_model.dart';

import '../blocs/top_game/top_game_bloc.dart';
import '../widgets/widgets.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: IconButton(
                    onPressed: () {
                      log("${media.width} x ${media.height}");
                    },
                    icon: const Icon(Icons.dashboard_outlined)),
              ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: const Image(
                image: NetworkImage(
                    "https://www.woolha.com/media/2020/03/eevee.png"),
              ),
            ),
          ),
          title: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "Summer Ray",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) =>
              TopGameBloc(httpClient: http.Client())..add(LoadTopGame()),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Search card
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    shadowColor: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "What would you \n    like to play?",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.search_outlined),
                                      ),
                                      Flexible(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Search games',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.filter_list_sharp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Search card

                  //Category row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Container(
                            //     padding: const EdgeInsets.all(10),
                            //     decoration: BoxDecoration(
                            //       color: const Color(0xFFffffff),
                            //       borderRadius: BorderRadius.circular(15),
                            //     ),
                            //     child: Text(
                            //       "Adventure",
                            //       style: Theme.of(context).textTheme.bodyLarge,
                            //     ),
                            //   ),
                            // ),
                            ActionChip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              side: BorderSide.none,
                              label: Text(
                                "Adventure",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              width: 15,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  //Category row
                  const SizedBox(height: 10),
                  //top games row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Games for you",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),

                  //Game cards
                  BlocBuilder<TopGameBloc, TopGameState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case TopGameStatus.failure:
                          return const Center(
                            child: Text("Failed to load top game!!!"),
                          );
                        case TopGameStatus.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case TopGameStatus.success:
                          return SizedBox(
                            height: 250,
                            child: ListView.builder(
                              itemCount: state.topGames.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    GameCard(
                                      game: state.topGames[index],
                                    ),
                                    const SizedBox(width: 20),
                                  ],
                                );
                              },
                            ),
                          );
                      }
                    },
                  )
                  //Game cards
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
