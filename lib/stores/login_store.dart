import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  

  @observable
  String email = '';
  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';
  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordvisible = false;
  @action
  void togglePasswordVisibility() => passwordvisible = !passwordvisible;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @computed
  bool get isEmailValid =>
      RegExp('[A-Za-z0-9\\._-]+@[A-Za-z]+\\.[A-Za-z]+').hasMatch(email);
  @computed
  bool get isPasswordValid => password.length >= 6;
  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
  @computed
  Function get loginPressed =>
  (isEmailValid && isPasswordValid && !loading) ? login : null;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedIn = true;

    email = '';
    password = '';
  }

  @action
  void logout(){
    loggedIn = false;
  }

}
