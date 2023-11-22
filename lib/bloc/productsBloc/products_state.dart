part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class ProductsBlocLoading extends ProductsState {}
class ProductsBlocLoaded extends ProductsState {}
class ProductsBlocError extends ProductsState {}
