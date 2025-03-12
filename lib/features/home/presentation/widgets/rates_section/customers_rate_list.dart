import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maher_law_app/core/theme/app_images.dart';
import 'package:maher_law_app/core/widget/adaptive_layout.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../data/models/rate_model.dart';
import 'rate_item.dart';

class CustomersRateList extends StatefulWidget {
  const CustomersRateList({super.key});

  @override
  State<CustomersRateList> createState() => _CustomersRateListState();
}

class _CustomersRateListState extends State<CustomersRateList> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      setState(() {});

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List rates = [
      RateModel(
        description: 'تعامل راقي واحترافية في العمل',
        name: 'محمد',
        image: AppImages.profilePic,
      ),
      RateModel(
        description: 'تعامل راقي واحترافية في العمل',
        name: 'محمد',
        image: AppImages.profilePic,
      ),
      RateModel(
        description: 'تعامل راقي واحترافية في العمل',
        name: 'محمد',
        image: AppImages.profilePic,
      ),
    ];
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged:
                (value) => setState(() => _currentPage = value.round()),
            pageSnapping: false,
            controller: _pageController,
            itemCount: 3,
            physics: const BouncingScrollPhysics(),
            allowImplicitScrolling: true,
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemBuilder: (context, index) {
              // return RateDesktopItem(rate: rates[index]);
              return AdaptiveLayout(
                mobileLayout: (_) => RateMobileItem(rate: rates[index]),
                tabletLayout: (_) => RateTabletItem(rate: rates[index]),
                desktopLayout: (_) => RateDesktopItem(rate: rates[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                  height: 6.0,
                  width: _currentPage == index ? 35.0 : 24.0,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index
                            ? AppColors.green
                            : AppColors.grey.withAlpha(180),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                );
              }).reversed.toList(),
        ),
      ],
    );
  }
}
