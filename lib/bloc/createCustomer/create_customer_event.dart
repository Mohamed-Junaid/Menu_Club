part of 'create_customer_bloc.dart';

@immutable
abstract class CreateCustomerEvent {}
class FetchCreateCustomer extends CreateCustomerEvent{
  final String name;
  final String place;
  final String phone;

  FetchCreateCustomer({required this.name,required this.place,required this.phone});
}
