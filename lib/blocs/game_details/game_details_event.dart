// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'game_details_bloc.dart';

class GameDetailsEvent extends Equatable {
  const GameDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadGameDetails extends GameDetailsEvent {
  final int id;
  const LoadGameDetails({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
