// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_games_categories/config/constant.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import 'package:flutter_games_categories/models/game_model.dart';

part 'top_game_event.dart';
part 'top_game_state.dart';

const _gameLimit = 5;
const throttleDuration = Duration(milliseconds: 1000);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class TopGameBloc extends Bloc<TopGameEvent, TopGameState> {
  final http.Client httpClient;

  TopGameBloc({
    required this.httpClient,
  }) : super(TopGameInitial()) {
    on<LoadTopGame>(_onTopGameFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onTopGameFetched(
      LoadTopGame event, Emitter<TopGameState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == TopGameStatus.loading) {
        final topGames = await _fetchTopGame();
        return emit(
          state.copyWith(
            status: TopGameStatus.success,
            topGames: topGames,
            hasReachedMax: false,
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: TopGameStatus.failure));
    }
  }

  Future<List<Game>> _fetchTopGame([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        "api.rawg.io",
        '/api/games',
        <String, String>{'key': '$apiKey', 'page_size': '$_gameLimit'},
      ),
    );

    // log(response.body);

    if (response.statusCode == 200) {
      final body = json.decode(response.body)["results"] as List;
      // log(body.toString());
      return List<Game>.from(body.map((x) => Game.fromMap(x)));
    }
    throw Exception('error fetching game');
  }
}
