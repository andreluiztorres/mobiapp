// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, deprecated_member_use, use_build_context_synchronously, unused_field, prefer_final_fields, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobi/components/clock..dart';
import 'package:mobi/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool _obscureText = true;
bool _rememberMe = false;
String _email = '';
String _senha = '';
bool _isLoading = false;

class _LoginState extends State<Login> {
  late Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _incrementData() async {
    // final SharedPreferences prefs = await _prefs;
    // setState(() {
    //   _prefs = prefs.setString('email', _email) as Future<SharedPreferences>;
    //   _prefs = prefs.setString('senha', _senha) as Future<SharedPreferences>;
    //   _prefs =
    //       prefs.setBool('rememberMe', _rememberMe) as Future<SharedPreferences>;
    // });
  }

  Future<dynamic> postLogar() async {
    var data = await Logar.postLogar(
      senha: _senha,
      email: _email,
    );
    if (data != null) {
      _incrementData();
      setState(() {
        _isLoading = false;
      });
      Navigator.pushNamed(context, '/home');
      return 'ok';
    } else {
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Opa.. algo deu errado!!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Usuário ou senha incorretos',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Verifique os dados e tente novamente.',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          );
        },
      );
      return 'err';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(233, 235, 243, 255),
          ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 34, 34, 44),
                ),
                child: Column(children: [
                  Container(
                    height: 100,
                    color: Color.fromARGB(255, 34, 34, 44),
                  ),
                  Image.asset('assets/logo.png'),
                ]),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 34, 34, 44))),
                          labelText: 'Digite o seu usuário',
                          prefixIcon: Icon(Icons.person_2_outlined)),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _senha = value;
                        });
                      },
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 34, 34, 44))),
                          labelText: 'Digite a sua senha',
                          suffixIcon: IconButton(
                            icon: _obscureText
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          prefixIcon: Icon(Icons.lock_outline)),
                    ),
                    SizedBox(height: 5),
                    // remember me
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        Text('Lembra Autenticação'),
                      ],
                    ),
                    SizedBox(height: 5),
                    // login button

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        postLogar();
                      },
                      child: _isLoading == false
                          ? const Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : CircularProgressIndicator(
                              color: Colors.white,
                            ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                        primary: Color.fromARGB(255, 34, 34, 44),
                      ),
                    ),

                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Clock(),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                        primary: Colors.yellow,
                      ),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.key),
                    SizedBox(height: 2),
                    Text('MobiToken',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}
