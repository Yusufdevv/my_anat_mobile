import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/data/repository/like_unlike_repository_impl.dart';
import 'package:anatomica/features/common/domain/usecases/like_doctor_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/like_vacancy_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/unlike_doctor_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/unlike_vacancy_usecase.dart';
import 'package:anatomica/features/common/presentation/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteButtonCandidate extends StatelessWidget {
  final CandidateListEntity candidate;

  const FavouriteButtonCandidate({required this.candidate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteBloc(
        likeDoctorUseCase: LikeDoctorUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
        unlikeDoctorUseCase: UnlikeDoctorUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
        likeVacancyUseCase: LikeVacancyUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
        unlikeVacancyUseCase: UnlikeVacancyUseCase(repository: serviceLocator<LikeUnlikeRepositoryImpl>()),
      ),
      child: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          return WScaleAnimation(
            onTap: () {
              context.read<FavouriteBloc>().add(LikeUnlikeCandidate(candidate: candidate));
            },
            child: SvgPicture.asset(
                state.isFavourite ?? candidate.isFavorite ? AppIcons.favouriteActive : AppIcons.favourite),
          );
        },
      ),
    );
  }
}
