part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}
class FetchProducts extends ProductsEvent{
 final String id;
 FetchProducts({required this.id});
}
