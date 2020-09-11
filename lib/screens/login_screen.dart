import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/login_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'list_screen.dart';
import 'list_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginStore _loginStore = LoginStore();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    autorun((_){
      if(_loginStore.loggedIn)
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> ListScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (_){
                        return CustomTextField(
                          hint: 'E-mail',
                          prefix: Icon(Icons.account_circle),
                          textInputType: TextInputType.emailAddress,
                          onChanged: _loginStore.setEmail,
                          enabled: !_loginStore.loading,
                        );
                      },
                    ),
                    const SizedBox(height: 16,),
                    Observer(
                      builder: (_){
                        return CustomTextField(
                          textInputType: TextInputType.number,
                          maxLength: 6,
                          hint: 'Senha',
                          prefix: Icon(Icons.lock),
                          obscure: !_loginStore.passwordVisible,
                          onChanged: _loginStore.setPass,
                          enabled: !_loginStore.loading,
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: Icons.visibility,
                            onTap: _loginStore.togglePasswordShow,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: Observer(
                        builder: (_){
                          return RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child:  _loginStore.loading ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white,),) : Text('Login'),
                            color: Theme.of(context).primaryColor,
                            disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            onPressed: _loginStore.loginPressed
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
