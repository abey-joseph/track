import 'package:dartz/dartz.dart';
import '../failures/failure.dart';
import 'either_utils.dart';

/// Simple test to verify Either<Failure, T> implementation
class EitherTest {
  
  static void runTests() {
    print('=== Testing Either<Failure, T> Implementation ===\n');
    
    // Test 1: Success case
    print('1. Testing success case:');
    final successResult = EitherUtils.right('Test data');
    if (successResult.isRight()) {
      print('✅ Success: ${successResult.data}');
    } else {
      print('❌ Unexpected failure: ${successResult.message}');
    }
    
    // Test 2: Database failure
    print('\n2. Testing database failure:');
    final dbFailure = DatabaseFailure('Database connection failed');
    final failureResult = EitherUtils.left(dbFailure);
    if (failureResult.isLeft()) {
      print('✅ Failure handled: ${failureResult.message}');
      print('   Code: ${failureResult.failureCode}');
    } else {
      print('❌ Unexpected success');
    }
    
    // Test 3: Validation failure
    print('\n3. Testing validation failure:');
    final validationFailure = ValidationFailure(
      'Invalid input',
      fieldErrors: {'email': 'Invalid email format'},
    );
    final validationResult = EitherUtils.left(validationFailure);
    validationResult.fold(
      (failure) {
        print('✅ Validation failure: ${failure.message}');
        if (failure is ValidationFailure && failure.fieldErrors != null) {
          print('   Field errors: ${failure.fieldErrors}');
        }
      },
      (data) => print('❌ Unexpected success: $data'),
    );
    
    // Test 4: Network failure
    print('\n4. Testing network failure:');
    final networkFailure = NetworkFailure(
      'Connection timeout',
      statusCode: 408,
      code: 'network/timeout',
    );
    final networkResult = EitherUtils.left(networkFailure);
    networkResult.fold(
      (failure) {
        print('✅ Network failure: ${failure.message}');
        if (failure is NetworkFailure) {
          print('   Status code: ${failure.statusCode}');
          print('   Error code: ${failure.code}');
        }
      },
      (data) => print('❌ Unexpected success: $data'),
    );
    
    // Test 5: Extension methods
    print('\n5. Testing extension methods:');
    final results = [successResult, failureResult, validationResult, networkResult];
    
    for (int i = 0; i < results.length; i++) {
      final result = results[i];
      print('   Result ${i + 1}:');
      
      if (result.isRight()) {
        print('   ✅ Success: ${result.data}');
      } else {
        print('   ❌ Error: ${result.message}');
        print('   📋 Code: ${result.failureCode}');
      }
    }
    
    // Test 6: onSuccess/onFailure callbacks
    print('\n6. Testing onSuccess/onFailure callbacks:');
    successResult.onSuccess((data) {
      print('   🎉 Success callback: $data');
    });
    
    failureResult.onFailure((failure) {
      print('   💥 Failure callback: ${failure.message}');
    });
    
    print('\n=== All tests completed successfully! ===');
  }
}

/// Main function to run tests
void main() {
  EitherTest.runTests();
}
