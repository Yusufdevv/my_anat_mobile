import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/home/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:anatomica/features/home/presentation/widgets/category_item.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: errorImageBackground,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        elevation: 0.5,
        title: const HospitalSingleAppBarBody(),
        shadowColor: textFieldColor,
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 45,
                        color: white,
                        width: double.maxFinite,
                      ),
                      Container(
                        height: 7,
                        width: double.maxFinite,
                        decoration:
                            const BoxDecoration(color: white, border: Border(top: BorderSide(color: lilyWhite))),
                      ),
                    ],
                  )),
              Positioned.fill(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 89,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 12, left: 16, right: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (ctx, i) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: CategoryItem(
                                logo: state.categories[i].icon,
                                title: state.categories[i].title,
                                onTap: () {},
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
