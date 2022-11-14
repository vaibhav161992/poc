import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc/blocs/app_state_bloc.dart';
import 'package:poc/blocs/weather/weather_bloc.dart';
import 'package:poc/core/localization/app_localization.dart';
import 'package:poc/core/theme/laf_colors.dart';
import 'package:poc/presentation/views/loading_view.dart';
import 'package:poc/presentation/widgets/single_line_input_content.dart';
import 'package:poc/routes/page_routes.dart';
import 'package:routemaster/routemaster.dart';

class HomeWidget extends StatelessWidget {
  static const keyPrefix = 'HomeWidget';
  final String userName;
  final String userEmail;
  final Locale locale;
  const HomeWidget(
      {Key? key,
      required this.userName,
      required this.userEmail,
      required this.locale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
     String searchText = '';
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppBar().preferredSize.height,
                  ),
                  Text(
                    AppLocalization.of(context)!.translate('welcome'),
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    userName,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: LAFColors.ltAppPrimaryColor),
                  ),
                  Text(
                    userEmail,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: LAFColors.ltLightGrayColor),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  onTap: (){
                    Routemaster.of(context).pop();
                    Routemaster.of(context).push(RelativePageRoutes.settings);
                  },
                  trailing: const Icon(Icons.arrow_forward_ios),
                  leading: const Icon(Icons.settings),
                  title:
                      Text(AppLocalization.of(context)!.translate('settings')),
                ),
                SizedBox(
                  width: 1.sw,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red),
                      onPressed: () {
                        BlocProvider.of<AppStateBloc>(context)
                            .add(const LogoutAppStateEvent());
                      },
                      child: Text(AppLocalization.of(context)!.translate('logout'))),
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title:  Text(
          AppLocalization.of(context)!.translate('homeAppBar'),
        ),
      ),
      body:  Container(
        padding: EdgeInsets.all(20.w),
        width: double.infinity, height: 1.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(AppLocalization.of(context)!.translate('search_location_title')),
            SizedBox(height: 20.h,),
            SingleLineInputContent(
                hintText: AppLocalization.of(context)!.translate('search_location_hint'),
                onChanged: (value){
                  searchText = value;
                }, onSubmitted: (value){

            }),
            Align(
              alignment: Alignment.topRight,
                child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: (){
                      BlocProvider.of<WeatherBloc>(context).add(GetWeatherEvent(cityName: searchText));
                    }, child: Text(AppLocalization.of(context)!.translate('get_weather'),style: Theme.of(context).textTheme.button,))),
            Expanded(

              child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if(state is WeatherOnLoadState){
                      return Center(child: Text(state.weatherData.name??''),);
                    }
                    else{
                      return const LoadingView();
                    }
                  }
              ),
            )

        ],)
      ),
    );
  }
}
