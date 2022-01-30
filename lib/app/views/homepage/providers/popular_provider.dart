import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/providers/api_repository_provider.dart';
import '../../../data/repository/remote/api_repository.dart';
import '../states/popular_state.dart';

final popularStateProvider = StateNotifierProvider<PopularNotifier, PopularState>((ref) {
  return PopularNotifier(apiRepository: ref.watch(apiRepositoryProvider));
});

class PopularNotifier extends StateNotifier<PopularState> {
  PopularNotifier({required APIRepository apiRepository})
      : _apiRepository = apiRepository,
        super(const PopularState.initial());

  final APIRepository _apiRepository;

  Future<void> fetchPopular() async {
    state = const PopularState.loading();
    try {
      final popular = await _apiRepository.getPopularTorrents();
      state = PopularState.data(data: popular);
    } catch (e) {
      state = const PopularState.error(error: 'Some Error Occurred!');
    }
  }
}
