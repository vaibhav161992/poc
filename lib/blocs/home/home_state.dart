part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {

}

class HomeOnLoadState extends HomeState {
final String userName;
final String userEmail;
final ThemeMode themeMode;
final Locale locale;
const HomeOnLoadState({required this.userEmail, required this.userName, required this.locale, required this.themeMode});

@override
  List<Object> get props => [
    userName,userEmail,locale,themeMode
];
}

