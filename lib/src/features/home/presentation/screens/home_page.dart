import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../presentation/widgets/reuseables.dart';
import '../widgets/dummy_appbar.dart';
import '../widgets/header_elements.dart';
import '../widgets/popular_list.dart';
import '../widgets/search_list.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final searchText = ref.watch(searchTextProvider);
    final isSearch = searchText != null && searchText.isNotEmpty;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            sizedH24,
            const Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: HeaderElements(),
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: 300.milliseconds,
                child: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: PopularList(),
                  ),
                  const SearchList(),
                ][(isSearch ? 1 : 0)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
