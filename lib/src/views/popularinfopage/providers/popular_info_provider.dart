import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../di.dart';
import '../../../data/repository/remote/api_repository.dart';
import '../states/popular_torrents_state.dart';

final currentImdbIdProvider = StateProvider<String?>((_) => null);

final popularTorrentsStateProvider = StateNotifierProvider<PopularTorrentsNotifier, PopularTorrentsState>(
  (ref) => PopularTorrentsNotifier(currentImdb: ref.watch(currentImdbIdProvider)),
);

class PopularTorrentsNotifier extends StateNotifier<PopularTorrentsState> {
  PopularTorrentsNotifier({required this.currentImdb}) : super(const PopularTorrentsState.initial());

  final String? currentImdb;

  Future<void> fetch({required String imdbId}) async {
    // This is to preserve state and unwanted reloads
    if (currentImdb == imdbId && state.isData) return;

    state = const PopularTorrentsState.loading();
    try {
      final torrents = await di<APIRepository>().getPopularTorrentsData(imdbId);
      state = PopularTorrentsState.data(data: torrents);
    } catch (e) {
      state = const PopularTorrentsState.error(error: 'Some Error Occurred!');
    }
  }
}
