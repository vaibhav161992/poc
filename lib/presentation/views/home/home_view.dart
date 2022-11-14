import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/blocs/home/home_bloc.dart';
import 'package:poc/presentation/widgets/home/home_widget.dart';
import '/blocs/app_state_bloc.dart';
import '/blocs/login/login_bloc.dart';
import '/presentation/views/loading_view.dart';
import '/presentation/widgets/login/login_widget.dart';

class HomeView extends StatelessWidget {
  static const keyPrefix = 'HomeView';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {

      },

      builder: (context, state) {
        print('Home Page Loaded');
        if (state is HomeOnLoadState) {
          return HomeWidget(
            userEmail: state.userEmail,
            userName: state.userName,
            locale: state.locale,
          );
        } else {
          return const LoadingView();
        }
      },
    );
  }
}
