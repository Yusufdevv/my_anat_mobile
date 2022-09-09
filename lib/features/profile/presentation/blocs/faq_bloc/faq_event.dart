part of 'faq_bloc.dart';

@immutable
abstract class FaqEvent {}

class GetFaqs extends FaqEvent {}

class GetMoreFaqs extends FaqEvent {}
