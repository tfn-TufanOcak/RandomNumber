import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth.dart';
import 'loginbutton.dart';

class SocialLogin extends StatelessWidget {
  final AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [

      Image.asset('assets/LogoApp.png', width: 180, height: 180,),
         Center(
           child: LoginButton(
            icon: FontAwesomeIcons.google,
            loginMethod: auth.googleSignIn,
      ),
         ),
    ]);
  }
}
