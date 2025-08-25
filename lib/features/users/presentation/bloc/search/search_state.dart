part of 'search_bloc.dart';

class SearchState extends Equatable {
  final String query;
  const SearchState({this.query = ''});

  @override
  List<Object> get props => [query];
}

final class SearchInitial extends SearchState {}
