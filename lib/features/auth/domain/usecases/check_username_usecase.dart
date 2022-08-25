import 'package:equatable/equatable.dart';
//
// class CheckUsernameUseCase implements UseCase<U>

class UsernameParams extends Equatable {
  final String username;
  const UsernameParams({required this.username});
  @override
  List<Object?> get props => [username];
}
