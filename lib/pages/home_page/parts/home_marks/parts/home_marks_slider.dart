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
  late TabController _tabCtrl;
  late List<ScrollController> _scrollControllers;

  final Set<int> _startedControllerIndexes = {};

  int get _tabLength => widget.markTypes.length + 1;

  @override
  void initState() {
    super.initState();
    _initControllers();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startForTab(0);
    });
  }

  void _initControllers() {
    _tabCtrl = TabController(length: _tabLength, vsync: this);

    _scrollControllers = List.generate(
      _tabLength * 2,
      (_) => ScrollController(),
    );

    _tabCtrl.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabCtrl.indexIsChanging) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _startForTab(_tabCtrl.index);
    });
  }

  @override
  void didUpdateWidget(covariant HomeMarksSlider oldWidget) {
    super.didUpdateWidget(oldWidget);

    final int oldLength = oldWidget.markTypes.length + 1;
    final int newLength = widget.markTypes.length + 1;

    if (oldLength != newLength) {
      _tabCtrl.removeListener(_onTabChanged);
      _tabCtrl.dispose();

      for (final controller in _scrollControllers) {
        controller.dispose();
      }

      _startedControllerIndexes.clear();

      _initControllers();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _startForTab(0);
      });

      setState(() {});
    }
  }

  String _getMarkTypeIdByTabIndex(int tabIndex) {
    if (tabIndex == 0) return '';
    return widget.markTypes[tabIndex - 1].id;
  }

  void _startForTab(int tabIndex) {
    final int firstCtrlIndex = tabIndex * 2;
    final int secondCtrlIndex = firstCtrlIndex + 1;

    if (firstCtrlIndex >= _scrollControllers.length ||
        secondCtrlIndex >= _scrollControllers.length) {
      return;
    }

    _startControllerIfNeeded(firstCtrlIndex, toMax: true);
    _startControllerIfNeeded(secondCtrlIndex, toMax: false);
  }

  void _startControllerIfNeeded(int controllerIndex, {required bool toMax}) {
    if (_startedControllerIndexes.contains(controllerIndex)) return;

    final ctrl = _scrollControllers[controllerIndex];

    if (!ctrl.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _startControllerIfNeeded(controllerIndex, toMax: toMax);
      });
      return;
    }

    _startedControllerIndexes.add(controllerIndex);

    if (toMax) {
      _startAutoScrollToMax(ctrl, controllerIndex);
    } else {
      _startAutoScrollToMin(ctrl, controllerIndex);
    }
  }

  void _startAutoScrollToMax(ScrollController ctrl, int controllerIndex) {
    if (!mounted || !ctrl.hasClients) return;

    final min = ctrl.position.minScrollExtent;
    final max = ctrl.position.maxScrollExtent;

    if (max <= min) return;

    _animateLoop(
      max: max,
      min: min,
      direction: max,
      second: 25,
      scrollCtrl: ctrl,
      controllerIndex: controllerIndex,
    );
  }

  void _startAutoScrollToMin(ScrollController ctrl, int controllerIndex) {
    if (!mounted || !ctrl.hasClients) return;

    final min = ctrl.position.minScrollExtent;
    final max = ctrl.position.maxScrollExtent;

    if (max <= min) return;

    ctrl.jumpTo(max);

    _animateLoop(
      max: max,
      min: min,
      direction: min,
      second: 25,
      scrollCtrl: ctrl,
      controllerIndex: controllerIndex,
    );
  }

  void _animateLoop({
    required double max,
    required double min,
    required double direction,
    required int second,
    required ScrollController scrollCtrl,
    required int controllerIndex,
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

          if (!_startedControllerIndexes.contains(controllerIndex)) return;

          final double newDirection = direction == max ? min : max;

          _animateLoop(
            max: max,
            min: min,
            direction: newDirection,
            second: second,
            scrollCtrl: scrollCtrl,
            controllerIndex: controllerIndex,
          );
        })
        .catchError((_) {
          // dispose veya attach sorunu olursa sessizce geç
        });
  }

  @override
  void dispose() {
    _tabCtrl.removeListener(_onTabChanged);
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
        HomeMoreButton(text: 'Yerli markalary'),
        HpsTabs(tabCtrl: _tabCtrl, markTypes: widget.markTypes),
        SizedBox(
          height: 2 * homeBestCompaniesCardHeight + 5,
          child: TabBarView(
            controller: _tabCtrl,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(_tabLength, (tabIndex) {
              final int firstCtrlIndex = tabIndex * 2;
              final int secondCtrlIndex = firstCtrlIndex + 1;
              final String markTypeId = _getMarkTypeIdByTabIndex(tabIndex);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HpsList(
                    scrollController: _scrollControllers[firstCtrlIndex],
                    markTypeId: markTypeId,
                  ),
                  const SizedBox(height: 5),
                  HpsList(
                    scrollController: _scrollControllers[secondCtrlIndex],
                    markTypeId: markTypeId,
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
