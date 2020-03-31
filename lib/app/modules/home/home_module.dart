import 'package:dio/dio.dart';
import 'package:studysmma/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studysmma/app/modules/home/home_page.dart';
import 'package:studysmma/app/modules/saved/saved_controller.dart';
import 'package:studysmma/app/modules/saved/saved_page.dart';
import 'package:studysmma/favorite_shared/save.preferences.dart';
import 'package:studysmma/dao/save.dao.dart';
import 'package:studysmma/repository/corona_repository.dart';
import 'package:studysmma/app/constraints.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SavedController(i.get<FavoritePreferences>())),
        Bind((i) => HomeController(i.get<CoronaRepository>())),
        Bind((i) => SaveDao(FAV_KEY)),
        Bind((i) => FavoritePreferences(i.get())),
        Bind((i) => CoronaRepository(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: "$URL_API/countries/"))),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/saved/', child: (_, args) => SavedPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
