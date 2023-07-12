import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_adam/utils/widget/custom_button_widget.dart';

import '../../../view_model/first_screen/user_provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  userProvider.user.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.3),
              child: Center(
                child: Text(
                  'Selected User Name',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.35),
              child: CustomButton(
                text: 'Choose a User',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
