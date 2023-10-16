import 'package:car_master/data/local/datasources/post/post_datasource.dart';
import 'package:car_master/data/network/apis/posts/post_api.dart';
import 'package:car_master/data/network/dio_client.dart';
import 'package:car_master/data/network/rest_client.dart';
import 'package:car_master/data/repository.dart';
import 'package:car_master/data/sharedpref/shared_preference_helper.dart';
import 'package:car_master/di/module/local_module.dart';
import 'package:car_master/di/module/network_module.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:car_master/stores/get_all_details_store/get_all_details_store.dart';
import 'package:car_master/stores/error/error_store.dart';
import 'package:car_master/stores/form/form_store.dart';
import 'package:car_master/stores/language/language_store.dart';
import 'package:car_master/stores/theme/theme_store.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(() => FormStore());

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(PostApi(getIt<DioClient>(), getIt<RestClient>()));

  // data sources
  getIt.registerSingleton(PostDataSource(await getIt.getAsync<Database>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
    getIt<PostApi>(),
    getIt<SharedPreferenceHelper>(),
    getIt<PostDataSource>(),
  ));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<Repository>()));
  getIt.registerSingleton(ThemeStore(getIt<Repository>()));
  getIt.registerSingleton(GetAllDetailsStore(getIt<Repository>()));
  // getIt.registerSingleton(BPStore(getIt<Repository>()));
  // getIt.registerSingleton(BTStore(getIt<Repository>()));
}
