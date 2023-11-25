part of 'create_customer_bloc.dart';

@immutable
abstract class CreateCustomerState {}

class CreateCustomerInitial extends CreateCustomerState {}
class CreateCustomerBlocLoading extends CreateCustomerState {}
class CreateCustomerBlocLoaded extends CreateCustomerState {}
class CreateCustomerBlocError extends CreateCustomerState {}
