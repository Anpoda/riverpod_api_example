import 'package:riverpod/riverpod.dart';
import 'package:riverpod_api_example/api/api_client.dart';
import 'package:riverpod_api_example/states/user_states.dart';

class UserStateNotifier extends StateNotifier<UserState>{
  
  UserStateNotifier({required ApiClient apiClient}) : _apiClient = apiClient, super(const UserState.initial());

  final ApiClient _apiClient;

  Future<void> getUser() async {
    try {
      state = const UserState.loading();
      var data = await _apiClient.getUser();
      state = UserState.success(user: data);
    } catch (e) {
      state = UserState.error("$e");
    }
  }
}