import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
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
    try {
      final items = await _getCategories.call(uid: event.uid);
      emit(CategoriesState.loaded(items));
    } catch (e) {
      emit(CategoriesState.failure(e.toString()));
    }
  }

  Future<void> _onAdd(_CategoriesAdd event, Emitter<CategoriesState> emit) async {
    try {
      await _addCategory.call(category: event.category);
      add(CategoriesEvent.reload(uid: event.category.uid));
    } catch (e) {
      emit(CategoriesState.failure(e.toString()));
    }
  }

  Future<void> _onUpdate(_CategoriesUpdate event, Emitter<CategoriesState> emit) async {
    try {
      await _updateCategory.call(category: event.category);
      add(CategoriesEvent.reload(uid: event.category.uid));
    } catch (e) {
      emit(CategoriesState.failure(e.toString()));
    }
  }

  Future<void> _onDelete(_CategoriesDelete event, Emitter<CategoriesState> emit) async {
    try {
      await _deleteCategory.call(categoryId: event.categoryId, uid: event.uid);
      add(CategoriesEvent.reload(uid: event.uid));
    } catch (e) {
      emit(CategoriesState.failure(e.toString()));
    }
  }

  Future<void> _onReload(_CategoriesReload event, Emitter<CategoriesState> emit) async {
    try {
      final items = await _getCategories.call(uid: event.uid);
      emit(CategoriesState.loaded(items));
    } catch (e) {
      emit(CategoriesState.failure(e.toString()));
    }
  }

  Future<bool> isCategoryInUse({required int categoryId, required String uid}) async {
    return await _isCategoryInUse.call(categoryId: categoryId, uid: uid);
  }
}


