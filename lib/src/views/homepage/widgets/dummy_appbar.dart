import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../gen/assets.gen.dart';
import '../../../config/colors.dart';
import '../../../config/font_weight.dart';
import '../../../presentation/widgets/frosted_glass.dart';
import '../providers/search_provider.dart';

final searchTextProvider = StateProvider<String?>((ref) => null);

class DummyAppBar extends StatefulHookConsumerWidget {
  const DummyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<DummyAppBar> createState() => _DummyAppBarState();
}

class _DummyAppBarState extends ConsumerState<DummyAppBar> {
  late final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchText = ref.watch(searchTextProvider);

    return GlassContainer(
      border: const Border.fromBorderSide(BorderSide(color: Colors.transparent)),
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                final text = ref.read(searchTextProvider);
                ref.read(searchStateProvider.notifier).searchTorrents(query: text);
              },
              child: Assets.icon.search.image(
                width: 22,
                height: 22,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: TextFormField(
                controller: _controller,
                style: const TextStyle(fontWeight: regular, fontSize: 18),
                onChanged: (text) => ref.read(searchTextProvider.state).state = text,
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (text) {
                  final text = ref.read(searchTextProvider);
                  ref.read(searchStateProvider.notifier).searchTorrents(query: text);
                },
                cursorColor: CColors.accentColor,
                decoration: InputDecoration.collapsed(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    fontWeight: regular,
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            if (ref.watch(searchTextProvider) != null && (searchText?.isNotEmpty ?? false))
              InkWell(
                child: const Icon(Icons.close),
                onTap: () {
                  _controller.clear();
                  ref.read(searchTextProvider.state).state = null;
                },
              )
          ],
        ),
      ),
    );
  }
}
