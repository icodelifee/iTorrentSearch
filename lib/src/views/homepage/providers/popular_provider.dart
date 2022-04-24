import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../di.dart';
import '../../../domain/repository/remote/api_repository.dart';
import '../states/popular_state.dart';

final popularStateProvider = StateNotifierProvider<PopularNotifier, PopularState>((ref) {
  return PopularNotifier();
});

class PopularNotifier extends StateNotifier<PopularState> {
  PopularNotifier() : super(const PopularState.initial());

  Future<void> fetchPopular({bool refresh = false}) async {
    if (refresh || !state.isData) {
      state = const PopularState.loading();

      try {
        final popular = await di<APIRepository>().getPopularTorrents();
        state = PopularState.data(data: popular);
      } catch (e) {
        state = const PopularState.error(error: 'Some Error Occurred!');
      }
    }
  }
}
