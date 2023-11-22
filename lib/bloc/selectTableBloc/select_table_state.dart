part of 'select_table_bloc.dart';

@immutable
abstract class SelectTableState {}

class SelectTableInitial extends SelectTableState {}
class SelectTableBlocLoading extends SelectTableState {}
class SelectTableBlocLoaded extends SelectTableState {}
class SelectTableBlocError extends SelectTableState {}
