import 'package:get_it/get_it.dart';
import 'package:netflix_ui/screens/profile/authbloc/auth_bloc.dart';
import 'package:profile_repository/profile_repository.dart';

import 'screens/profile/bloc/profile_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /**
   * Features - Login
   */
  // Bloc

  sl.registerFactory(() => ProfileBloc(
    profileRepository: sl(),
  ));

  sl.registerFactory(() => AuthBloc(
    profileRepository: sl(),
  ));


  // Use cases
  //sl.registerLazySingleton(() => GetLoginResponseUseCase(sl()));
  //sl.registerLazySingleton(() => GetLoginTokenUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepository(
  ));

}
