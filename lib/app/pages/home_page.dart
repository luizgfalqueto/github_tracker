import 'package:flutter/material.dart';
import 'package:github_tracker/app/utils/theme_app.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _searchEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeApp.primaryColor,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/github_logo.png',
                width: 120,
                color: Colors.white,
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Informe o usuário do GitHub',
                    style: ThemeApp.titleRegularStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            // height: 48,
                            child: TextFormField(
                              controller: _searchEC,
                              validator: Validatorless.multiple([
                                Validatorless.required('Informe um usuário')
                              ]),
                              style: ThemeApp.titleRegularStyle,
                              decoration: ThemeApp.inputDecoration,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                final isValid = _formKey.currentState?.validate() ?? false;
          
                                if(isValid) {}
                              },
                              child: const Text('Pesquisar'),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
