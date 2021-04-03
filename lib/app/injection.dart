import 'package:app_flutter/app/database/sqlite/DAO/annotations_dao_impl.dart';
import 'package:app_flutter/app/domain/entidades/annotations.dart';
import 'package:app_flutter/app/domain/interfaces/annotations_dao.dart';
import 'package:app_flutter/app/domain/services/annotations_services.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<DAOAnnotations>(ImplDaoAnnotations());
  getIt.registerSingleton<AnnotationsServices>(AnnotationsServices());
}
