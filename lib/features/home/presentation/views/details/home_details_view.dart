import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/presentation/views/details/widgets/home_details_view_body.dart';
import 'package:flutter/material.dart';

class HomeDetailsView extends StatelessWidget {
  final BookEntity bookEntity;
  const HomeDetailsView({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeDetailsViewBody(
          bookEntity: bookEntity,
        ),
      ),
    );
  }
}
