import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/enums/search_provider.dart';
import '../../../data/providers/api_repository_provider.dart';
import '../../../data/repository/remote/api_repository.dart';
import '../states/search_state.dart';

final selectedSearchTabProvider = StateProvider<SearchProvider>(
  (ref) => SearchProvider.values.first,
);

final searchStateProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier(apiRepository: ref.watch(apiRepositoryProvider));
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier({required APIRepository apiRepository})
      : _apiRepository = apiRepository,
        super(const SearchState.initial());

  final APIRepository _apiRepository;

  Future<void> searchTorrents({required String? query}) async {
    state = const SearchState.loading();

    // ignore: omit_local_variable_types
    final SearchResult searchR = {};
    final q = query?.trim();
    try {
      searchR[SearchProvider.leetX] = await _apiRepository.search1337x(q!);
      searchR[SearchProvider.piratebay] = await _apiRepository.searchTPB(q);
      // searchR[SearchProvider.rarbg] = [];
      state = SearchState.data(data: searchR);
    } catch (e) {
      state = const SearchState.error(error: 'Some Error Occured! Please Try Later!');
    }
  }
}
