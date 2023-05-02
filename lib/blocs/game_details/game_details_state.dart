// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'game_details_bloc.dart';

enum GameDetailsStatus { loading, success, failure }

class GameDetailsState extends Equatable {
  final GameDetailsStatus status;
  final Game game;

  const GameDetailsState({
    this.status = GameDetailsStatus.loading,
    this.game = const Game(),
  });

  @override
  List<Object> get props => [status, game];

  GameDetailsState copyWith({
    GameDetailsStatus? status,
    Game? game,
  }) {
    return GameDetailsState(
      status: status ?? this.status,
      game: game ?? this.game,
    );
  }

  @override
  bool get stringify => true;
}

class GameDetailsInitial extends GameDetailsState {}
