import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tcc_app/service/auth_service.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final MockUserCredential mockUserCredential = MockUserCredential();
  final MockUser mockUser = MockUser();

  test('Teste de autenticação bem-sucedida', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
      email: 'test@test.com',
      password: 'password',
    )).thenAnswer((_) async => mockUserCredential);

    when(mockUserCredential.user).thenReturn(mockUser);

    expect(
      await authService(
        email: 'test@test.com',
        password: 'password',
        onSuccess: () {},
      ),
      isInstanceOf<UserCredential>(),
    );
  });

  test('Teste de autenticação falhada', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
      email: 'test@test.com',
      password: 'password',
    )).thenThrow(FirebaseAuthException(code: 'user-not-found'));

    expect(
      await authService(
        email: 'test@test.com',
        password: 'password',
        onUserNotFound: () {},
      ),
      null,
    );
  });
}
