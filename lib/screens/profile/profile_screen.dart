import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_ui/constants.dart';
import 'package:netflix_ui/injection_container.dart';
import 'package:netflix_ui/screens/profile/authbloc/auth_bloc.dart';
import 'package:netflix_ui/screens/profile/authbloc/auth_event.dart';
import 'package:netflix_ui/screens/profile/authbloc/auth_state.dart';
import 'package:netflix_ui/screens/profile/bloc/profile_bloc.dart';
import 'package:netflix_ui/screens/profile/components/profile_card.dart';
import 'package:profile_repository/profile_repository.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Widget> _widgets = [];

  AuthBloc authBloc = sl<AuthBloc>();

  late StreamSubscription<AuthState> _subscriptionAuth;

  var isClicked = false;

  @override
  void initState() {
    super.initState();
    print("profile initState");

    onSubscription();
  }

  Future<void> onSubscription() async {
    _subscriptionAuth = authBloc.stream.listen((event) {
      print("subscription event auth profile : $event");
      if (event is LoadedAuth) {
        print("subscription event auth profile LoadedAuth");
      }
    });

    _subscriptionAuth.onData((data) {
      print("subscription onData : $data");
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscriptionAuth.cancel();
  }

  late AuthState _state;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (BuildContext contest) => sl<AuthBloc>(),
          )
        ],
        child:
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          print("profile state : $state");

          if (state is LoadedProfiles) {
            state.profiles.forEach((element) {
              _widgets.add(ProfileCard(profile: element));
            });
          }
          authBloc.stream.listen((state) {
            print("profile stream listen : $state");
          });
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              //state의 변경에 따라 실행 되어야 하는것들
              print("profile blocListener : $state");
              if (state is LoadedAuth) {
                print("profile loadedAuth");
              }
              if (state is LoadedAuth2) {
                print("profile loadedAuth2");
              }
              setState(() => _state = state);
            },
          );

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                "MODU PLAY",
                style: kTitleTextStyle,
              ),
              actions: [
                Icon(FontAwesomeIcons.pen, size: 18.0),
                const SizedBox(width: 12.0)
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                    print("profile auth state: $state");
                    return Visibility(child: Container(), visible: false);
                  }),
                  Text(
                    "모두의플레이를 시청할 프로필을 선택하세요.",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  const SizedBox(height: 25.0),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Wrap(
                        spacing: 25.0,
                        children: _widgets,
                        /*
                        children: [

                          if(state is Loaded) ProfileCard(profile: state.profile),
                          AddCard(),
                        ],
                        */
                      )),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print("floating button onPress");
                BlocProvider.of<ProfileBloc>(context).add(GetProfile());

                isClicked == false
                    ? BlocProvider.of<AuthBloc>(context).add(GetAuth(Profile(
                        sId: '0',
                        imageUrl: 'assets/images/dog.jpg',
                        name: 'dog')))
                    : BlocProvider.of<AuthBloc>(context).add(Get2Auth(Profile(
                        sId: '3',
                        imageUrl: 'assets/images/dog.jpg',
                        name: 'dog')));

                isClicked = !isClicked;
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
          );
        }));
  }
}
