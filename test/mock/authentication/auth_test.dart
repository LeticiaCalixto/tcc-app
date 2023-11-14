import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tcc_app/view/pages/home/login_page.dart';
import 'package:tcc_app/view/pages/home/register_page.dart';

void main() {
  group('LoginPage', () {
    testWidgets('campos de email e senha', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());

      final emailFieldFinder = find.widgetWithText(TextField, 'Email');
      final passwordFieldFinder = find.widgetWithText(TextField, 'Senha');

      expect(emailFieldFinder, findsOneWidget);
      expect(passwordFieldFinder, findsOneWidget);
    });

    testWidgets('Valida o login com email e senha', (WidgetTester tester) async {
      await tester.pumpWidget(const LoginPage());

      final emailFieldFinder = find.byKey(const Key('email_field'));
      final passwordFieldFinder = find.byKey(const Key('password_field'));
      final loginButtonFinder = find.widgetWithText(ElevatedButton, 'Login');

      expect(emailFieldFinder, findsOneWidget);
      expect(passwordFieldFinder, findsOneWidget);
      expect(loginButtonFinder, findsOneWidget);
    //colocar valor de teste nos campos
      await tester.enterText(emailFieldFinder, 'aaa@example.com');
      await tester.enterText(passwordFieldFinder, 'password');
      //apertar o botao de login para testar
      await tester.tap(loginButtonFinder);
      await tester.pumpAndSettle();
    });
  });
  group('RegisterPage', () {
    testWidgets('campos de cadastro', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final nameFieldFinder = find.widgetWithText(TextField, 'Nome');
      final emailFieldFinder = find.widgetWithText(TextField, 'Email');
      final passwordFieldFinder = find.widgetWithText(TextField, 'Senha');

      expect(nameFieldFinder, findsOneWidget);
      expect(emailFieldFinder, findsOneWidget);
      expect(passwordFieldFinder, findsOneWidget);
    });

    testWidgets('Valida o formulário de cadastro', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final nameFieldFinder = find.byKey(const Key('name_field'));
      final emailFieldFinder = find.byKey(Key('email_field'));
      final passwordFieldFinder = find.byKey(Key('password_field'));
      final registerButtonFinder = find.widgetWithText(ElevatedButton, 'Cadastrar');

      expect(nameFieldFinder, findsOneWidget);
      expect(emailFieldFinder, findsOneWidget);
      expect(passwordFieldFinder, findsOneWidget);
      expect(registerButtonFinder, findsOneWidget);

      // colocar os valores de teste nos campos
      await tester.enterText(nameFieldFinder, 'aaa');
      await tester.enterText(emailFieldFinder, 'aaa@example.com');
      await tester.enterText(passwordFieldFinder, 'password');

      // apertar o botão de cadastro para testar
      await tester.tap(registerButtonFinder);
      await tester.pumpAndSettle();
    });
  });
}