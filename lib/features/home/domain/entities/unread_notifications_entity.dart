import 'package:equatable/equatable.dart';

class UnreadNotificationsEntity extends Equatable {
  final bool unread;
  final int count;

  const UnreadNotificationsEntity({
    this.unread = false,
    this.count = 0,
  });

  @override
  List<Object?> get props => [unread, count];
}
