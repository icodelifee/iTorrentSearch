import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/torrent.dart';
import '../../../domain/enums/search_provider.dart';

part 'search_state.freezed.dart';

typedef SearchResult = Map<SearchProvider, List<Torrent>>;

@Freezed()
class SearchState with _$SearchState {
  const factory SearchState.initial() = _SearchStateInitial;
  const factory SearchState.loading() = _SearchStateLoading;
  const factory SearchState.data({required Map<SearchProvider, List<Torrent>> data}) = _SearchStateData;
  const factory SearchState.error({String? error}) = _SearchStateError;
}

extension SearchStateGetters on SearchState {
  bool get isInitial => this is _SearchStateInitial;
  bool get isLoading => this is _SearchStateLoading;
  bool get isData => this is _SearchStateData;
  bool get isError => this is _SearchStateError;

  Map<SearchProvider, List<Torrent>>? get data => (this as _SearchStateData).data;
  String? get error => (this as _SearchStateError).error;
}
