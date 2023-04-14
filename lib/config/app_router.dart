import 'package:flutter_games_categories/models/game_model.dart';
import 'package:flutter_games_categories/screens/screens.dart';
import 'package:go_router/go_router.dart';

GoRouter AppRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        name: "navScreen",
        path: "/",
        builder: (context, state) => CustomNavBar(),
        routes: [
          GoRoute(
            name: "details",
            path: "details/:gameId",
            builder: (context, state) {
              Game game = state.extra as Game;
              return GameDetailsScreen(currentGame: game);
            },
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
    initialLocation: "/",
  );
}
