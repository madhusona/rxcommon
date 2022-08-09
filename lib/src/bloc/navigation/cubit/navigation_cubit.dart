import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.whatson:
        emit(NavigationState(NavbarItem.whatson, 0));
        break;
      case NavbarItem.fav:
        emit(NavigationState(NavbarItem.fav, 1));
        break;
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 2));
        break;
        case NavbarItem.profile:
      emit(NavigationState(NavbarItem.profile, 3));
      break;
      case NavbarItem.wallet:
        emit(NavigationState(NavbarItem.wallet, 4));
        break;
      case NavbarItem.fnb:
        emit(NavigationState(NavbarItem.fnb, 5));
        break;
    }
  }
}