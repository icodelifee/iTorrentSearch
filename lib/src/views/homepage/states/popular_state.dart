import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/remote/popular.dart';

part 'popular_state.freezed.dart';

@Freezed()
class PopularState with _$PopularState {
  const factory PopularState.initial() = _PopularStateInitial;
  const factory PopularState.loading() = _PopularStateLoading;
  const factory PopularState.data({required List<Popular> data}) = _PopularStateData;
  const factory PopularState.error({String? error}) = _PopularStateError;
}

extension PopularStateGetters on PopularState {
  bool get isInitial => this is _PopularStateInitial;
  bool get isLoading => this is _PopularStateLoading;
  bool get isData => this is _PopularStateData;
  bool get isError => this is _PopularStateError;

  List<Popular>? get data => (this as _PopularStateData).data;
  String? get error => (this as _PopularStateError).error;
}
