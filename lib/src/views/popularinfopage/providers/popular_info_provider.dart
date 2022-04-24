import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/providers/api_repository_provider.dart';
import '../../../data/repository/remote/api_repository.dart';
import '../states/popular_torrents_state.dart';

final currentImdbIdProvider = StateProvider<String?>((_) => null);

final popularTorrentsStateProvider = StateNotifierProvider<PopularTorrentsNotifier, PopularTorrentsState>((ref) {
  final apiRepo = ref.watch(apiRepositoryProvider);
  final currentImdb = ref.watch(currentImdbIdProvider);

  return PopularTorrentsNotifier(apiRepository: apiRepo, currentImdb: currentImdb);
});

class PopularTorrentsNotifier extends StateNotifier<PopularTorrentsState> {
  PopularTorrentsNotifier({required APIRepository apiRepository, required this.currentImdb})
      : _apiRepository = apiRepository,
        super(const PopularTorrentsState.initial());

  final APIRepository _apiRepository;
  final String? currentImdb;

  Future<void> fetch({required String imdbId}) async {
    // This is to preserve state and unwanted reloads
    if (currentImdb == imdbId && state.isData) return;

    state = const PopularTorrentsState.loading();
    try {
      final torrents = await _apiRepository.getPopularTorrentsData(imdbId);
      state = PopularTorrentsState.data(data: torrents);
    } catch (e) {
      state = const PopularTorrentsState.error(error: 'Some Error Occurred!');
    }
  }
}
