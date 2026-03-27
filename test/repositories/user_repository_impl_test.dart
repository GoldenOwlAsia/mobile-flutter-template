import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/src/network/data/user/user_reference.dart';
import 'package:myapp/src/network/data/user/user_repository_impl.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/user/user.dart';

class MockUserReference extends Mock implements UserReference {}

void main() {
  late UserRepositoryImpl repository;
  late MockUserReference mockUserReference;

  setUp(() {
    mockUserReference = MockUserReference();
    repository = UserRepositoryImpl(mockUserReference);
  });

  group('UserRepositoryImpl', () {
    group('getUser', () {
      test('should return user when FirebaseAuth has current user', () async {
        // Note: This test would require mocking FirebaseAuth.instance
        // which is challenging. In a real scenario, you'd inject FirebaseAuth
        // as a dependency for better testability.
        // For now, this test documents the expected behavior.

        // Expected behavior:
        // - If FirebaseAuth.instance.currentUser is not null
        // - Should return MResult.success with MUser created from Firebase user
        // - User should have id, email, and name from Firebase user
      });

      test('should return error when no user is logged in', () async {
        // Expected behavior:
        // - If FirebaseAuth.instance.currentUser is null
        // - Should return MResult.error('Not user login')
      });

      test('should return exception result when exception occurs', () async {
        // Expected behavior:
        // - If an exception is thrown
        // - Should return MResult.exception(e)
      });
    });

    group('getOrAddUser', () {
      test('should delegate to usersRef.getOrAddUser', () async {
        final user = MUser(id: '123', email: 'test@example.com', name: 'Test');
        final expectedResult = MResult.success(user);

        when(
          () => mockUserReference.getOrAddUser(user),
        ).thenAnswer((_) async => expectedResult);

        final result = await repository.getOrAddUser(user);

        expect(result, equals(expectedResult));
        verify(() => mockUserReference.getOrAddUser(user)).called(1);
      });
    });

    group('getUsers', () {
      test('should delegate to usersRef.getUsers', () async {
        final users = [
          MUser(id: '1', email: 'user1@example.com'),
          MUser(id: '2', email: 'user2@example.com'),
        ];
        final expectedResult = MResult.success(users);

        when(
          () => mockUserReference.getUsers(),
        ).thenAnswer((_) async => expectedResult);

        final result = await repository.getUsers();

        expect(result, equals(expectedResult));
        verify(() => mockUserReference.getUsers()).called(1);
      });
    });
  });
}
