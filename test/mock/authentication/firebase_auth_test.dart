import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tcc_app/service/auth_service.dart';
import 'package:tcc_app/view/pages/home/login_page.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
  });

  test('Teste de autenticação bem-sucedida', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer((_) async => UserCredential());

    expect(
        await authService(
            email: 'test@test.com',
            password: 'password',
            onSuccess: () {},
            onUserNotFound: () {},
            onWrongPassword: () {}),
        isInstanceOf<UserCredential>());
  });

  test('Teste de autenticação falhada - usuário não encontrado', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenThrow(FirebaseAuthException(code: 'user-not-found'));

    expect(
        await authService(
            email: 'test@test.com',
            password: 'password',
            onSuccess: () {},
            onUserNotFound: () {},
            onWrongPassword: () {}),
        null);
  });

  // Adicione mais testes para outros cenários
}