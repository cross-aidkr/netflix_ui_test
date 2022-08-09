import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/screens/main_screens.dart';
import 'package:netflix_ui/screens/profile/authbloc/auth_bloc.dart';
import 'package:netflix_ui/screens/profile/authbloc/auth_event.dart';
import 'package:netflix_ui/screens/profile/bloc/profile_bloc.dart';
import 'package:netflix_ui/screens/profile/bloc/profile_event.dart';
import 'package:profile_repository/profile_repository.dart';

import '../authbloc/auth_state.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;

  const ProfileCard({
    Key? key,
    required this.profile
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image(
              image: AssetImage(profile.imageUrl),
              width: 100.0,
              height: 100.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            profile.name,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, MainScreens.routeName, arguments: profile);
        BlocProvider.of<ProfileBloc>(context).add(SaveProfile(profile));

        BlocProvider.of<AuthBloc>(context).add(GetAuth(profile));
      },
    );
  }
}
