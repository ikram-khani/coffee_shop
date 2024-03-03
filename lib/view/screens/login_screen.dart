import 'package:coffee_shop/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/in_line_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true; //initialy the password text is obscure
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const Image(
                fit: BoxFit.cover,
                width: double.infinity,
                image: AssetImage('assets/images/coffe_background.png'),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.only(bottom: 5, left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Email Address",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              cursorColor: Theme.of(context).primaryColor,
                              controller: _emailController,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                ),
                                hintText: 'Enter Your Email',
                                hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@')) {
                                  return 'Please enter a valid email address.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            const Text(
                              "Password",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              cursorColor: Theme.of(context).primaryColor,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                ),
                                hintText: 'Enter Your Password',
                                hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                  ),
                                ),
                              ),
                              obscureText: _obscureText,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must be atleast 6 character long.';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         const ResetPasswordScreen(),
                          //   ),
                          // );
                        },
                        child: const Text(
                          'Forgot your password ?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const InLineText(
                        text: 'OR',
                      ),
                      TextButton(
                        onPressed: () async {
                          // setState(() {
                          //   isNavigationLoading = true;
                          // });
                          // await Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const SignUpScreen(),
                          //   ),
                          // );
                          _emailController.clear();
                          _passwordController.clear();
                          // setState(() {
                          //   isNavigationLoading = false;
                          // });
                        },
                        child:
                            //isNavigationLoading
                            //     ? const Center(
                            //         child: CircularProgressIndicator(),
                            //       )
                            //     :
                            const Text(
                          'Create an Account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
