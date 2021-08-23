import 'package:bloc/bloc.dart';

enum NavigationState {
  offers,
  services,
  donor,
  center,
  moderator,
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.offers);
  offers() => emit(NavigationState.offers);
  services() => emit(NavigationState.services);
  donor() => emit(NavigationState.donor);
  center() => emit(NavigationState.center);
  moderator() => emit(NavigationState.moderator);
}
