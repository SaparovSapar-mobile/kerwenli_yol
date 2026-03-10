import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/mark_type.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_marks/parts/hps_list.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_marks/parts/hps_tabs.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomeMarksSlider extends StatefulWidget {
  const HomeMarksSlider({super.key, required this.markTypes});

  final List<MarkTypeModel> markTypes;

  @override
  State<HomeMarksSlider> createState() => _HomeMarksSliderState();
}

class _HomeMarksSliderState extends State<HomeMarksSlider>
    with SingleTickerProviderStateMixin {
  late final TabController _tabCtrl;
  late final List<ScrollController> _scrollControllers;

  int get _tabLength => widget.markTypes.length + 1;

  @override
  void initState() {
    super.initState();

    _tabCtrl = TabController(length: _tabLength, vsync: this);

    _scrollControllers = List.generate(
      _tabLength * 2,
      (_) => ScrollController(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startForTab(0);
    });

    _tabCtrl.addListener(() {
      if (_tabCtrl.indexIsChanging) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startForTab(_tabCtrl.index);
      });
    });
  }

  void _startForTab(int tabIndex) {
    final firstCtrlIndex = tabIndex * 2;
    final secondCtrlIndex = firstCtrlIndex + 1;

    if (firstCtrlIndex >= _scrollControllers.length ||
        secondCtrlIndex >= _scrollControllers.length) {
      return;
    }

    _startAutoScrollToMax(_scrollControllers[firstCtrlIndex]);
    _startAutoScrollToMin(_scrollControllers[secondCtrlIndex]);
  }

  void _startAutoScrollToMax(ScrollController ctrl) {
    if (!mounted) return;
    if (!ctrl.hasClients) return;

    final min = ctrl.position.minScrollExtent;
    final max = ctrl.position.maxScrollExtent;

    _animateLoop(
      max: max,
      min: min,
      direction: max,
      second: 25,
      scrollCtrl: ctrl,
    );
  }

  void _startAutoScrollToMin(ScrollController ctrl) {
    if (!mounted) return;
    if (!ctrl.hasClients) return;

    final min = ctrl.position.minScrollExtent;
    final max = ctrl.position.maxScrollExtent;

    ctrl.jumpTo(max);

    _animateLoop(
      max: max,
      min: min,
      direction: min,
      second: 25,
      scrollCtrl: ctrl,
    );
  }

  void _animateLoop({
    required double max,
    required double min,
    required double direction,
    required int second,
    required ScrollController scrollCtrl,
  }) {
    if (!mounted || !scrollCtrl.hasClients) return;

    scrollCtrl
        .animateTo(
          direction,
          duration: Duration(seconds: second),
          curve: Curves.linear,
        )
        .then((_) {
          if (!mounted || !scrollCtrl.hasClients) return;

          final newDirection = direction == max ? min : max;

          _animateLoop(
            max: max,
            min: min,
            direction: newDirection,
            second: second,
            scrollCtrl: scrollCtrl,
          );
        });
  }

  @override
  void dispose() {
    _tabCtrl.dispose();

    for (final controller in _scrollControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(text: 'Yerli markalary', onTap: () {}),
        HpsTabs(tabCtrl: _tabCtrl, markTypes: widget.markTypes),
        SizedBox(
          height: 2 * homeBestCompaniesCardHeight + 5,
          child: TabBarView(
            controller: _tabCtrl,
            children: List.generate(_tabLength, (tabIndex) {
              final firstCtrlIndex = tabIndex * 2;
              final secondCtrlIndex = firstCtrlIndex + 1;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HpsList(
                    scrollController: _scrollControllers[firstCtrlIndex],
                    // isterseniz burada ilgili tab datasını da gönderebilirsiniz
                    // markType: tabIndex == 0 ? null : widget.markTypes[tabIndex - 1],
                  ),
                  const SizedBox(height: 5),
                  HpsList(
                    scrollController: _scrollControllers[secondCtrlIndex],
                    // markType: tabIndex == 0 ? null : widget.markTypes[tabIndex - 1],
                  ),
                ],
              );
            }),
          ),
        ),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
