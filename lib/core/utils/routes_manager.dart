import 'package:bookly/core/presentation/dependency_injection.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/details/home_details_view.dart';
import 'package:bookly/features/home/presentation/views/home/home_page.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homeView = '/homeView';
  static const homeDetailsView = '/homeDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) {
          initHomeModule();
          return const HomeView();
        },
      ),
      GoRoute(
        path: homeDetailsView,
        builder: (context, state) {
          initHomeDetailModule();
          return BlocProvider(
            create: (context) =>
              SimilarBooksCubit(instance())..fetchSimilarBooks(),
            child: HomeDetailsView(
              bookEntity: state.extra as BookEntity,
            ),
          );
        },
      ),
    ],
  );
}
