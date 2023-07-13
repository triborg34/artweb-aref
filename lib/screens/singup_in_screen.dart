// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:forcomp/model/coustmermodel.dart';
import 'package:forcomp/screens/homescreen.dart';
import 'package:forcomp/screens/mianviewscreen.dart';
import 'package:forcomp/util/auth.dart';
import 'package:forcomp/util/controllest.dart';
import 'package:get/get.dart';

class SingUp_InScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
      () {
        return Center(
          child: Get.find<SingsControllers>().isSingup.value
              ? SingupForm()
              : Get.find<SingsControllers>().isLogin.value
                  ? LoginForm()
                  : Sing_Login_Raw(),
        );
      },
    ));
  }
}

class LoginForm extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController passwrod = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: username,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'نام کابری',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.purple),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: passwrod,
                style: TextStyle(color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'رمز عبور',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.purple),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                Get.find<SingsControllers>().isLogin.value =
                    !Get.find<SingsControllers>().isLogin.value;

                Get.snackbar("ورود موفقیت آمیز بود", "",
                    duration: Duration(seconds: 1),
                    colorText: Colors.white,
                    backgroundColor: Colors.purple.withOpacity(0.5),
                    barBlur: 10.0);
                await Get.to(() => FutureBuilder(
                      future:
                          Singup.loginCustomer(username.text, passwrod.text),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Get.find<SceensControllers>().bnIndex = 0;
                          Get.find<SceensControllers>().body = HomeScreen();

                          return MainvaiewPage();
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ));

                // await Singup.loginCustomer(username.text, passwrod.text);

                // Perform login here
              },
              style: TextButton.styleFrom(backgroundColor: Colors.purple),
              child: Text(
                'ورود',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.find<SingsControllers>().isLogin.value =
                      !Get.find<SingsControllers>().isLogin.value;
                  Get.find<SingsControllers>().isSingup.value =
                      !Get.find<SingsControllers>().isSingup.value;
                },
                child: Text("ثبت نام نکرده اید؟"))
          ],
        ),
      ),
    );
  }
}

class SingupForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 350),
      opacity: Get.find<SingsControllers>().isSingup.value ? 1.0 : 0.0,
      curve: Curves.bounceIn,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        labelText: 'ایمیل',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.purple,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لطفا ایمیل خود را وارد کنید';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        labelText: 'نام کاربری',
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.purple,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لطفا نام کاربری را وارد کنید';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        labelText: 'نام',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.purple,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لطفا نام را وارد کنید';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        labelText: 'نام خانوادگی',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.purple,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لطفا نام خانوادگی را وارد کنید';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        labelText: 'رمز عبور',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.purple,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لطفا رمز را وارد کنید';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.purple),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, perform signup logic here
                          String email = _emailController.text;
                          String username = _usernameController.text;
                          String firstName = _firstNameController.text;
                          String lastName = _lastNameController.text;
                          String password = _passwordController.text;

                          Get.find<SingsControllers>().isLogin.value =
                    true;
                    Get.find<SingsControllers>().isSingup.value =
                    false;

                    Get.snackbar("","ثبت نام موفقیت آمیز بود",duration: Duration(seconds: 1),colorText: Colors.white,backgroundColor: Colors.purple);
                          await Get.to(() => FutureBuilder(
                                future: Singup.createCustomer(CoustomerModel(
                                    email: email,
                                    password: password,
                                    firstname: firstName,
                                    lastname: lastName,
                                    username: email)),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    Get.find<SceensControllers>().body =
                                        SingUp_InScreen();
                                    

                                    return MainvaiewPage();
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              ));

                          // Perform signup logic
                          // ...

                          // Clear form fields
                          _emailController.clear();
                          _usernameController.clear();
                          _firstNameController.clear();
                          _lastNameController.clear();
                          _passwordController.clear();
                        }
                      },
                      child: Text('ثبت نام'),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.find<SingsControllers>().isLogin.value =
                              !Get.find<SingsControllers>().isLogin.value;
                          Get.find<SingsControllers>().isSingup.value =
                              !Get.find<SingsControllers>().isSingup.value;
                        },
                        child: Text("قبلا ثبت نام کرده اید؟"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sing_Login_Raw extends StatelessWidget {
  const Sing_Login_Raw({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 350),
      opacity: Get.find<SingsControllers>().isSingup.value ? 0.0 : 1.0,
      curve: Curves.bounceIn,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
            width: Get.width,
            child: ElevatedButton(
              onPressed: () {
                Get.find<SingsControllers>().isSingup.value =
                    !Get.find<SingsControllers>().isSingup.value;
              },
              child: Text(
                "ثبت نام",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              style: TextButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.purple),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
            width: Get.width,
            child: ElevatedButton(
              onPressed: () {
                Get.find<SingsControllers>().isLogin.value =
                    !Get.find<SingsControllers>().isLogin.value;
              },
              child: Text(
                "وارد شدن",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              style: TextButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
