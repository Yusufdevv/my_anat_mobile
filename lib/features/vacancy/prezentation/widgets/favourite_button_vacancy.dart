import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/data/repository/like_unlike_repository_impl.dart';
import 'package:anatomica/features/common/domain/usecases/like_doctor_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/like_vacancy_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/unlike_doctor_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/unlike_vacancy_usecase.dart';
import 'package:anatomica/features/common/presentation/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/register_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteButtonVacancy extends StatelessWidget {
  final VacancyListEntity vacancy;
  final Color? activeColor;
  final Color? inactiveColor;

  const FavouriteButtonVacancy({required this.vacancy, this.activeColor, this.inactiveColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteBloc(
        likeDoctorUseCase: LikeDoctorUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
        unlikeDoctorUseCase: UnlikeDoctorUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
        likeVacancyUseCase: LikeVacancyUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
        unlikeVacancyUseCase: UnlikeVacancyUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
      ),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, authState) {
          return BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return WScaleAnimation(
                onTap: () {
                  if (authState.status == AuthenticationStatus.authenticated) {
                    context.read<FavouriteBloc>().add(LikeUnlikeVacancy(vacancy: vacancy));
                  } else {
                    showRegisterBottomSheet(context);
                  }
                },
                child: SvgPicture.asset(
                  state.isFavourite ?? vacancy.isFavorite ? AppIcons.favouriteActive : AppIcons.favourite,
                  color: state.isFavourite ?? vacancy.isFavorite ? activeColor : inactiveColor,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
