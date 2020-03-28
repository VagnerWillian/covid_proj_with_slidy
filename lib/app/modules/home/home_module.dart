import 'package:dio/dio.dart';
import 'package:studysmma/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studysmma/app/modules/home/home_page.dart';
import 'package:studysmma/repository/corona_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<CoronaRepository>())),
        Bind((i) => CoronaRepository(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: "https://coronavirus-19-api.herokuapp.com/countries/"))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
