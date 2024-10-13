import 'package:flutter/material.dart';
import 'common/commonTextField.dart';
import 'homePage.dart';

// LogIn Page
class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 100),
              // TODO - a logo?
              Image.network(
                "https://cdn.pixabay.com/photo/2016/09/14/20/50/tooth-1670434_1280.png",
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 50),
              Text(
                "Medication App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),

              const SizedBox(height: 80),

              // Email Field
              CommonTextField(
                controller: emailController,
                hintText: 'Enter your email',
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIconData: Icons.email,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),

              // Password Field
              CommonTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                labelText: 'Password',
                prefixIconData: Icons.password,
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 32),

              Container(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('There is an input of email or password'),
                      ));
                      return;
                    }

                    setState(() {
                      isLoading = true;
                    });

                    Future.delayed(Duration(milliseconds: 1000), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));

                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  child: isLoading
                      ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.white,
                    ),
                  )
                      : Text('LOG IN'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
