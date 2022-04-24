import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/remote/torrent.dart';

part 'popular_torrents_state.freezed.dart';

@Freezed()
class PopularTorrentsState with _$PopularTorrentsState {
  const factory PopularTorrentsState.initial() = _PopularTorrentsStateInitial;
  const factory PopularTorrentsState.loading() = _PopularTorrentsStateLoading;
  const factory PopularTorrentsState.data({required List<Torrent> data}) = _PopularTorrentsStateData;
  const factory PopularTorrentsState.error({String? error}) = _PopularTorrentsStateError;
}

extension PopularTorrentsStateX on PopularTorrentsState {
  bool get isInitial => this is _PopularTorrentsStateInitial;
  bool get isLoading => this is _PopularTorrentsStateLoading;
  bool get isData => this is _PopularTorrentsStateData;
  bool get isError => this is _PopularTorrentsStateError;

  List<Torrent>? get data => (this as _PopularTorrentsStateData).data;
  String? get error => (this as _PopularTorrentsStateError).error;
}
