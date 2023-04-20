import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';
import 'package:anatomica/features/map/data/models/suggestion.dart';

class GetSuggestionsUseCase extends UseCase<List<SuggestionModel>, SuggestionParam> {
  final GlobalRequestRepository repo = serviceLocator<GlobalRequestRepository>();

  @override
  Future<Either<Failure, List<SuggestionModel>>> call(SuggestionParam params) {
    return repo.getList(
        endpoint: params.isDoctor ? '/doctor/search/suggest/' : '/organization/search/suggest/',
        fromJson: SuggestionModel.fromJson,
        sendToken: false,
        query: {
          'search': params.search,
        });
  }
}

class SuggestionParam {
  final String search;
  final bool isDoctor;
  final String where;

  SuggestionParam({required this.where, required this.isDoctor, required this.search});
}
