import 'package:expense_tracker/domain/domain_injector.dart';
import 'package:expense_tracker/locale/locale_injector.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector
    ..registerDomain()
    ..registerLocale();
}
