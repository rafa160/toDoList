import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  void togglePasswordShow() => passwordVisible = !passwordVisible;

  @action
  void setEmail(String value) => email = value;

  @action
  void  setPass(String value) => password = value;

  @computed
  bool get isFormValid => email.length >= 6 && password.length >= 6;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedIn = true;

  }

  @computed
  Function get loginPressed => (isFormValid && !loading) ? login : null;


}