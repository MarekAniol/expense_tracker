part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    required List<Expense> expenses,
  }) = _HomeScreenState;

  factory HomeScreenState.initial() => const HomeScreenState(
        expenses: [],
      );
}
