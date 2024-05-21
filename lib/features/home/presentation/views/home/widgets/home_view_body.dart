import 'package:bookly/core/utils/assets_manager.dart';
import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/features/home/presentation/views/home/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/home/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p30,
                  bottom: AppPadding.p30,
                ),
                child: Center(
                  child: Image.asset(ImageAssets.logo, height: AppSize.s30),
                ),
              ),
              const FeaturedListView(),
              const SizedBox(height: AppSize.s50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
                child: Text('Newest Books', style: Styles.textStyle20),
              ),
              const SizedBox(height: AppSize.s20),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
