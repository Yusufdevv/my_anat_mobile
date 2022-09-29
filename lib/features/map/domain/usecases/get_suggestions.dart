import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';
import 'package:anatomica/features/map/data/models/suggestion.dart';

class GetSuggestionsUseCase extends UseCase<List<SuggestionModel>, SuggestionParam> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, List<SuggestionModel>>> call(SuggestionParam param) {
    return repo.getList(
        endpoint: param.isDoctor ? '/doctor/search/suggest/' : '/organization/search/suggest/',
        fromJson: SuggestionModel.fromJson,
        query: {
          'search': param.search,
        });
  }
}

class SuggestionParam {
  final String search;
  final bool isDoctor;

  SuggestionParam({required this.isDoctor, required this.search});
}
