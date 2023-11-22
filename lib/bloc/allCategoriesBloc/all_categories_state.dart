part of 'all_categories_bloc.dart';

@immutable
abstract class AllCategoriesState {}

class AllCategoriesInitial extends AllCategoriesState {}
class AllCategoriesBlocLoading extends AllCategoriesState {}
class AllCategoriesBlocLoaded extends AllCategoriesState {}
class AllCategoriesBlocError extends AllCategoriesState {}


