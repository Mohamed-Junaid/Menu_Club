part of 'select_customer_bloc.dart';

@immutable
abstract class SelectCustomerState {}

class SelectCustomerInitial extends SelectCustomerState {}
class SelectCustomerBlocLoading extends SelectCustomerState {}
class SelectCustomerBlocLoaded extends SelectCustomerState {}
class SelectCustomerBlocError extends SelectCustomerState {}