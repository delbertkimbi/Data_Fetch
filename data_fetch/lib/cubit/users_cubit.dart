import 'package:data_fetch/models/user.dart';
import 'package:data_fetch/repo/repo_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_state.dart';


class UsersCubit extends Cubit<List<User>> {
  late final DataService _dataService;

  UsersCubit(this._dataService) : super([]);

  Future<void> getUsers() async {
    try {
      emit(UsersLoading() as List<User>);
      final reponds = await _dataService.getUsers();
      emit(UsersLoaded(reponds) as List<User>);
    } 
    catch (e) {
      emit(UsersError(e.toString()) as List<User>);
    }
  }
}
