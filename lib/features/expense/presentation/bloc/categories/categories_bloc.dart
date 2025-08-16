import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/services/logging_service.dart';
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
    
    logger.info('Loading categories for user: ${event.uid}', tag: 'CategoriesBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _getCategories.call(uid: event.uid);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(CategoriesState.failure(failure.message));
        
        logger.logFailure(
          failure,
          operation: 'loadCategories',
          userId: event.uid,
          context: {'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        logger.logUserAction(
          'load_categories_failed',
          userId: event.uid,
          screen: 'categories_page',
          parameters: {'error': failure.message, 'errorCode': failure.code},
        );
      },
      (categories) {
        stopwatch.stop();
        emit(CategoriesState.loaded(categories));
        
        logger.logSuccess(
          'Load categories',
          userId: event.uid,
          context: {'categoryCount': categories.length, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        logger.logUserAction(
          'load_categories_success',
          userId: event.uid,
          screen: 'categories_page',
          parameters: {'categoryCount': categories.length},
        );
      },
    );
  }

  Future<void> _onAdd(_CategoriesAdd event, Emitter<CategoriesState> emit) async {
    logger.info('Adding category: ${event.category.name}', tag: 'CategoriesBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _addCategory.call(category: event.category);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(CategoriesState.failure(failure.message));
        
        logger.logFailure(
          failure,
          operation: 'addCategory',
          userId: event.category.uid,
          context: {'categoryName': event.category.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        logger.logUserAction(
          'add_category_failed',
          userId: event.category.uid,
          screen: 'categories_page',
          parameters: {'error': failure.message, 'categoryName': event.category.name},
        );
      },
      (_) {
        stopwatch.stop();
        
        logger.logSuccess(
          'Add category',
          userId: event.category.uid,
          context: {'categoryName': event.category.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        logger.logUserAction(
          'add_category_success',
          userId: event.category.uid,
          screen: 'categories_page',
          parameters: {'categoryName': event.category.name},
        );
        
        add(CategoriesEvent.reload(uid: event.category.uid));
      },
    );
  }

  Future<void> _onUpdate(_CategoriesUpdate event, Emitter<CategoriesState> emit) async {
    logger.info('Updating category: ${event.category.name}', tag: 'CategoriesBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _updateCategory.call(category: event.category);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(CategoriesState.failure(failure.message));
        
        logger.logFailure(
          failure,
          operation: 'updateCategory',
          userId: event.category.uid,
          context: {'categoryId': event.category.categoryId, 'categoryName': event.category.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        logger.logUserAction(
          'update_category_failed',
          userId: event.category.uid,
          screen: 'categories_page',
          parameters: {'error': failure.message, 'categoryId': event.category.categoryId, 'categoryName': event.category.name},
        );
      },
      (_) {
        stopwatch.stop();
        
        logger.logSuccess(
          'Update category',
          userId: event.category.uid,
          context: {'categoryId': event.category.categoryId, 'categoryName': event.category.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        logger.logUserAction(
          'update_category_success',
          userId: event.category.uid,
          screen: 'categories_page',
          parameters: {'categoryId': event.category.categoryId, 'categoryName': event.category.name},
        );
        
        add(CategoriesEvent.reload(uid: event.category.uid));
      },
    );
  }

  Future<void> _onDelete(_CategoriesDelete event, Emitter<CategoriesState> emit) async {
    logger.info('Deleting category: ${event.categoryId}', tag: 'CategoriesBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _deleteCategory.call(categoryId: event.categoryId, uid: event.uid);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(CategoriesState.failure(failure.message));
        
        logger.logFailure(
          failure,
          operation: 'deleteCategory',
          userId: event.uid,
          context: {'categoryId': event.categoryId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        logger.logUserAction(
          'delete_category_failed',
          userId: event.uid,
          screen: 'categories_page',
          parameters: {'error': failure.message, 'categoryId': event.categoryId},
        );
      },
      (_) {
        stopwatch.stop();
        
        logger.logSuccess(
          'Delete category',
          userId: event.uid,
          context: {'categoryId': event.categoryId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        logger.logUserAction(
          'delete_category_success',
          userId: event.uid,
          screen: 'categories_page',
          parameters: {'categoryId': event.categoryId},
        );
        
        add(CategoriesEvent.reload(uid: event.uid));
      },
    );
  }

  Future<void> _onReload(_CategoriesReload event, Emitter<CategoriesState> emit) async {
    logger.info('Reloading categories for user: ${event.uid}', tag: 'CategoriesBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _getCategories.call(uid: event.uid);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(CategoriesState.failure(failure.message));
        
        logger.logFailure(
          failure,
          operation: 'reloadCategories',
          userId: event.uid,
          context: {'durationMs': stopwatch.elapsed.inMilliseconds},
        );
      },
      (categories) {
        stopwatch.stop();
        emit(CategoriesState.loaded(categories));
        
        logger.logSuccess(
          'Reload categories',
          userId: event.uid,
          context: {'categoryCount': categories.length, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
      },
    );
  }

  Future<bool> isCategoryInUse({required int categoryId, required String uid}) async {
    logger.info('Checking if category is in use: $categoryId', tag: 'CategoriesBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _isCategoryInUse.call(categoryId: categoryId, uid: uid);
    
    return result.fold(
      (failure) {
        stopwatch.stop();
        
        logger.logFailure(
          failure,
          operation: 'isCategoryInUse',
          userId: uid,
          context: {'categoryId': categoryId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        return false; // Default to false on failure
      },
      (isInUse) {
        stopwatch.stop();
        
        logger.logSuccess(
          'Check category in use',
          userId: uid,
          context: {'categoryId': categoryId, 'isInUse': isInUse, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        return isInUse;
      },
    );
  }
}


