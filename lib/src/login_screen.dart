import 'package:filter_option_task/src/home_screen.dart';
import 'package:filter_option_task/utils/colors.dart';
import 'package:filter_option_task/utils/global_variable.dart';
import 'package:filter_option_task/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ThemeData themeData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.text = 'Fininfocom';
    _passwordController.text = 'Fin@123';
  }

  void loginUser() async {
    //navi
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isLoading = true;
      });

      await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: loginScreenBodyUI()),
    );
  }

  Widget loginScreenBodyUI() {
    return Container(
      padding: MediaQuery.of(context).size.width > webScreenSize
          ? EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 3)
          : const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Align(
                alignment: Alignment.center,
                child: Text('LOGIN', style: themeData.textTheme.titleLarge)),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            const SizedBox(
              height: 64,
            ),
            Text('User Name :', style: themeData.textTheme.subtitle1),
            const SizedBox(
              height: 5,
            ),
            TextFieldInput(
              hintText: 'Enter user name',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
              validateName: true,
            ),
            const SizedBox(
              height: 24,
            ),
            Text('Password :', style: themeData.textTheme.subtitle1),
            const SizedBox(
              height: 5,
            ),
            TextFieldInput(
              hintText: 'Enter your password',
              textInputType: TextInputType.text,
              textEditingController: _passwordController,
              isPass: true,
              validateName: false,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: loginUser,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: blueColor,
                ),
                child: !_isLoading
                    ? const Text(
                        'Log in',
                      )
                    : const CircularProgressIndicator(
                        color: primaryColor,
                      ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    'Dont have an account?',
                  ),
                ),
                GestureDetector(
                  // onTap: () => Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const SignupScreen(),
                  //   ),
                  // ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      ' Signup.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
