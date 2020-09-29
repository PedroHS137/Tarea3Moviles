part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class ErrorState extends HomeState {
  final String error;

  ErrorState({@required this.error});
  @override
  List<Object> get props => [error];
}

class ShowUsersState extends HomeState {
  final List<User> usersList;

  ShowUsersState({@required this.usersList});
  @override
  List<Object> get props => [usersList];
}

class FilterUsersPState extends HomeState {
  final List<User> userListP;
  FilterUsersPState({@required this.userListP});
  @override
  List<Object> get props => [userListP];
}

class FilterUsersIState extends HomeState {
  final List<User> userListI;
  FilterUsersIState({@required this.userListI});
  @override
  List<Object> get props => [userListI];
}
