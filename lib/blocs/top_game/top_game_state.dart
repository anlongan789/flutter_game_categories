// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'top_game_bloc.dart';

enum TopGameStatus { loading, success, failure }

class TopGameState extends Equatable {
  const TopGameState({
    this.status = TopGameStatus.loading,
    this.topGames = const <Game>[],
    this.hasReachedMax = false,
  });

  final TopGameStatus status;
  final List<Game> topGames;
  final bool hasReachedMax;

  @override
  List<Object> get props => [status, topGames, hasReachedMax];

  TopGameState copyWith({
    TopGameStatus? status,
    List<Game>? topGames,
    bool? hasReachedMax,
  }) {
    return TopGameState(
      status: status ?? this.status,
      topGames: topGames ?? this.topGames,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  bool get stringify => true;
}

class TopGameInitial extends TopGameState {}
