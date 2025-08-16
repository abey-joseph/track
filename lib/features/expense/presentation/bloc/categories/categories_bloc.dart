import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/use_cases/get_categories.dart';
import 'package:track/features/expense/domain/use_cases/modify_category.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategories _getCategories;
  final AddCategory _addCategory;
  final UpdateCategory _updateCategory;
  final DeleteCategory _deleteCategory;
  final IsCategoryInUse _isCategoryInUse;

  CategoriesBloc(
    this._getCategories,
    this._addCategory,
    this._updateCategory,
    this._deleteCategory,
    this._isCategoryInUse,
  ) : super(const CategoriesState.initial()) {
    on<_CategoriesLoad>(_onLoad);
    on<_CategoriesAdd>(_onAdd);
    on<_CategoriesUpdate>(_onUpdate);
    on<_CategoriesDelete>(_onDelete);
    on<_CategoriesReload>(_onReload);
  }

  Future<void> _onLoad(_CategoriesLoad event, Emitter<CategoriesState> emit) async {
    emit(const CategoriesState.loading());
    
    final result = await _getCategories.call(uid: event.uid);
    
    result.fold(
      (failure) {
        emit(CategoriesState.failure(failure.message));
        print('Categories load failed: ${failure.message}, Code: ${failure.code}');
        if (failure.cause != null) {
          print('Cause: ${failure.cause}');
        }
      },
      (categories) {
        emit(CategoriesState.loaded(categories));
      },
    );
  }

  Future<void> _onAdd(_CategoriesAdd event, Emitter<CategoriesState> emit) async {
    final result = await _addCategory.call(category: event.category);
    
    result.fold(
      (failure) {
        emit(CategoriesState.failure(failure.message));
        print('Add category failed: ${failure.message}');
      },
      (_) {
        // Success - reload the categories
        add(CategoriesEvent.reload(uid: event.category.uid));
      },
    );
  }

  Future<void> _onUpdate(_CategoriesUpdate event, Emitter<CategoriesState> emit) async {
    final result = await _updateCategory.call(category: event.category);
    
    result.fold(
      (failure) {
        emit(CategoriesState.failure(failure.message));
        print('Update category failed: ${failure.message}');
      },
      (_) {
        // Success - reload the categories
        add(CategoriesEvent.reload(uid: event.category.uid));
      },
    );
  }

  Future<void> _onDelete(_CategoriesDelete event, Emitter<CategoriesState> emit) async {
    final result = await _deleteCategory.call(categoryId: event.categoryId, uid: event.uid);
    
    result.fold(
      (failure) {
        emit(CategoriesState.failure(failure.message));
        print('Delete category failed: ${failure.message}');
      },
      (_) {
        // Success - reload the categories
        add(CategoriesEvent.reload(uid: event.uid));
      },
    );
  }

  Future<void> _onReload(_CategoriesReload event, Emitter<CategoriesState> emit) async {
    final result = await _getCategories.call(uid: event.uid);
    
    result.fold(
      (failure) {
        emit(CategoriesState.failure(failure.message));
        print('Categories reload failed: ${failure.message}');
      },
      (categories) {
        emit(CategoriesState.loaded(categories));
      },
    );
  }

  Future<bool> isCategoryInUse({required int categoryId, required String uid}) async {
    final result = await _isCategoryInUse.call(categoryId: categoryId, uid: uid);
    return result.fold(
      (failure) {
        print('Check category in use failed: ${failure.message}');
        return false; // Default to false on failure
      },
      (isInUse) => isInUse,
    );
  }
}


