import 'package:expense_tracker/domain/domain_injector.dart';
import 'package:expense_tracker/domain/service/expense_service.dart';
import 'package:expense_tracker/locale/locale_injector.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> init() async {
  await injector.registerDomain();
  await injector.registerLocale();
  injector.registerFactory<HomeScreenBloc>(
    () => HomeScreenBloc(
      expenseService: injector.get<ExpenseService>(),
    ),
  );
}
