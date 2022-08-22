import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_example/api/api_client.dart';
import 'package:riverpod_api_example/states/user_statenotifier.dart';
import 'package:riverpod_api_example/states/user_states.dart';

final userNotifierProvider = StateNotifierProvider<UserStateNotifier, UserState>(((ref) => UserStateNotifier(apiClient: ref.watch(_apiClientProvider))));

final _apiClientProvider = Provider<ApiClient>((ref) => ApiClient(),);
