// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_games_categories/models/game_model.dart';

import '../../config/constant.dart';

part 'game_details_event.dart';
part 'game_details_state.dart';

class GameDetailsBloc extends Bloc<GameDetailsEvent, GameDetailsState> {
  final http.Client httpClient;

  GameDetailsBloc({
    required this.httpClient,
  }) : super(GameDetailsInitial()) {
    on<LoadGameDetails>(_onGameDetailsFetched);
  }

  Future<void> _onGameDetailsFetched(
      LoadGameDetails event, Emitter<GameDetailsState> emit) async {
    try {
      if (state.status == GameDetailsStatus.loading) {
        final game = await _getGameDetails(event.id);
        return emit(
          state.copyWith(
            status: GameDetailsStatus.success,
            game: game,
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: GameDetailsStatus.failure));
    }
  }

  Future<Game> _getGameDetails(int id) async {
    final response = await httpClient.get(
      Uri.https(
        "api.rawg.io",
        '/api/games/$id',
        <String, String>{'key': '$apiKey'},
      ),
    );

    log(response.body);

    if (response.statusCode == 200) {
      Game game = Game.fromMap(json.decode(response.body));
      return game;
    }

    throw Exception("Cannot fetch game details");
  }
}
