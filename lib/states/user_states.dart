import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_api_example/model/user_model.dart';

part 'user_states.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState.initial() = _UserInitial;
  const factory UserState.loading() = _UserLoading;
  const factory UserState.success({required User user}) = _UserLoadedSuccess;
  const factory UserState.error([String? message]) = _UserLoadedError;
}