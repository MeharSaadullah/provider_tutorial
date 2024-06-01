import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/Auth_provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text('Log in')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(hintText: 'E-mail'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                authProvider.login(emailcontroller.text.toString(),
                    passwordcontroller.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: authProvider.loading
                        ? CircularProgressIndicator()
                        : Text('log in')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
