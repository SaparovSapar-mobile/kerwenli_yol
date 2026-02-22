import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_partners_slider/parts/hps_list.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_partners_slider/parts/hps_tabs.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomePartnersSlider extends StatefulWidget {
  const HomePartnersSlider({super.key});

  @override
  State<HomePartnersSlider> createState() => _HomePartnersSliderState();
}

class _HomePartnersSliderState extends State<HomePartnersSlider>
    with SingleTickerProviderStateMixin {
  late final TabController _tabCtrl;

  final ScrollController _scrollCtrl1 = ScrollController();
  final ScrollController _scrollCtrl2 = ScrollController();
  final ScrollController _scrollCtrl3 = ScrollController();
  final ScrollController _scrollCtrl4 = ScrollController();
  final ScrollController _scrollCtrl5 = ScrollController();
  final ScrollController _scrollCtrl6 = ScrollController();

  @override
  void initState() {
    super.initState();

    _tabCtrl = TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startForTab(0); // ilk tab
    });

    _tabCtrl.addListener(() {
      if (_tabCtrl.indexIsChanging) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startForTab(_tabCtrl.index);
      });
    });
  }

  void _startForTab(int index) {
    switch (index) {
      case 0:
        _startAutoScrollToMax(_scrollCtrl1);
        _startAutoScrollToMin(_scrollCtrl2);
        break;
      case 1:
        _startAutoScrollToMax(_scrollCtrl3);
        _startAutoScrollToMin(_scrollCtrl4);
        break;
      case 2:
        _startAutoScrollToMax(_scrollCtrl5);
        _startAutoScrollToMin(_scrollCtrl6);
        break;
    }
  }

  void _startAutoScrollToMax(ScrollController ctrl) {
    if (!mounted) return;
    if (!ctrl.hasClients) return;

    final min = ctrl.position.minScrollExtent;
    final max = ctrl.position.maxScrollExtent;

    _animateLoop(max, min, max, 25, ctrl);
  }

  void _startAutoScrollToMin(ScrollController ctrl) {
    if (!mounted) return;
    if (!ctrl.hasClients) return;

    final min = ctrl.position.minScrollExtent;
    final max = ctrl.position.maxScrollExtent;

    ctrl.jumpTo(max);

    _animateLoop(max, min, min, 25, ctrl);
  }

  _animateLoop(
    double max,
    double min,
    double direction,
    int second,
    ScrollController scrollCtrl,
  ) {
    if (!mounted || !scrollCtrl.hasClients) return;

    scrollCtrl
        .animateTo(
          direction,
          duration: Duration(seconds: second),
          curve: Curves.linear,
        )
        .then((value) {
          if (!mounted || !scrollCtrl.hasClients) return;

          direction = direction == max ? min : max;
          _animateLoop(max, min, direction, second, scrollCtrl);
        });
  }

  @override
  void dispose() {
    _tabCtrl.dispose();

    _scrollCtrl1.dispose();
    _scrollCtrl2.dispose();
    _scrollCtrl3.dispose();
    _scrollCtrl4.dispose();
    _scrollCtrl5.dispose();
    _scrollCtrl6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(text: 'Yerli markalary', onTap: () {}),
        HpsTabs(tabCtrl: _tabCtrl),
        SizedBox(
          height: 2 * homeBestCompaniesCardHeight + 5,
          child: TabBarView(
            controller: _tabCtrl,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HpsList(scrollController: _scrollCtrl1),
                  SizedBox(height: 5),
                  HpsList(scrollController: _scrollCtrl2),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HpsList(scrollController: _scrollCtrl3),
                  SizedBox(height: 5),
                  HpsList(scrollController: _scrollCtrl4),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HpsList(scrollController: _scrollCtrl5),
                  SizedBox(height: 5),
                  HpsList(scrollController: _scrollCtrl6),
                ],
              ),
            ],
          ),
        ),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
