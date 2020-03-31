import 'package:dio/dio.dart';
import 'package:studysmma/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studysmma/app/modules/home/home_page.dart';
import 'package:studysmma/favorite_shared/favorite.shared.dart';
import 'package:studysmma/dao/favorite.dao.dart';
import 'package:studysmma/repository/corona_repository.dart';
import 'package:studysmma/app/constraints.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<CoronaRepository>(), i.get<FavoriteShared>())),
        Bind((i) => FavoriteDao(FAV_KEY)),
        Bind((i) => FavoriteShared(i.get())),
        Bind((i) => CoronaRepository(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: "$URL_API/countries/"))),

      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
