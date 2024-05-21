import 'package:bookly/core/presentation/constant.dart';
import 'package:bookly/core/presentation/dependency_injection.dart';
import 'package:bookly/core/presentation/my_bloc_observer%20.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initMainMethodApp() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(Constant.featuredBox);
  await Hive.openBox<BookEntity>(Constant.newestBox);
  await Hive.openBox<BookEntity>(Constant.similarBox);
  Bloc.observer = MyBlocObserver();
  await initAppModule();
}
