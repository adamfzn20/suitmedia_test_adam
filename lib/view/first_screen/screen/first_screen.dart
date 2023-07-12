import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_adam/utils/widget/custom_button_widget.dart';
import 'package:suitmedia_test_adam/view/first_screen/widget/custom_textformfield_widget.dart';
import 'package:suitmedia_test_adam/view/second_screen/screen/second_screen.dart';
import 'package:suitmedia_test_adam/view_model/first_screen/name_provider.dart';

import '../../../view_model/first_screen/palindrom_provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    PalindromeProvider palindromeProvider =
        Provider.of<PalindromeProvider>(context, listen: false);

    void checkPalindrome() {
      if (_formKey.currentState!.validate()) {
        String palindrome = _palindromeController.text;
        palindromeProvider.checkPalindrome(palindrome);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(palindromeProvider.palindromeResult),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    }

    void goToSecondScreen() {
      String name = _nameController.text;
      final userProvider = Provider.of<NameProvider>(context, listen: false);

      if (_formKey.currentState!.validate()) {
        userProvider.setName(name);
        userProvider.saveUserData();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecondScreen()),
        );
        _nameController.clear();
        _palindromeController.clear();
      }
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/background_1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 34.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: screenHeight * 0.15,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white30,
                  radius: 50,
                  child: Icon(
                    Icons.person_add_alt_1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 51,
                ),
                CustomTextFormField(
                  textInputAction: TextInputAction.next,
                  hint: 'Name',
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  textInputAction: TextInputAction.done,
                  hint: 'Palindrome',
                  controller: _palindromeController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 45,
                ),
                CustomButton(
                  text: 'CHECK',
                  onPressed: checkPalindrome,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(text: 'NEXT', onPressed: goToSecondScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
