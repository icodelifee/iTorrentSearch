import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../di.dart';
import '../../../domain/enums/search_provider.dart';
import '../../../domain/repository/remote/api_repository.dart';
import '../states/search_state.dart';

final selectedSearchTabProvider = StateProvider<SearchProvider>(
  (ref) => SearchProvider.values.first,
);

final searchStateProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(const SearchState.initial());

  Future<void> searchTorrents({required String? query}) async {
    state = const SearchState.loading();

    // ignore: omit_local_variable_types
    final SearchResult searchR = {};
    final q = query?.trim();
    try {
      searchR[SearchProvider.leetX] = await di<APIRepository>().search1337x(q!);
      searchR[SearchProvider.piratebay] = await di<APIRepository>().searchTPB(q);
      // searchR[SearchProvider.rarbg] = [];
      state = SearchState.data(data: searchR);
    } catch (e) {
      state = const SearchState.error(error: 'Some Error Occured! Please Try Later!');
    }
  }
}
