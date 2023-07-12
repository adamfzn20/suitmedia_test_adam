import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_adam/view/third_screen/widget/users_list_widget.dart';
import 'package:suitmedia_test_adam/view_model/third_screen/get_users_list_provider.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetUsersListProvider>().getUserListData();
    });
    super.initState();
  }

  Future<void> _refreshPage() async {
    context.read<GetUsersListProvider>().getUserListData();
  }

  @override
  Widget build(BuildContext context) {
    // final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
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
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: ListView(
            children: const [
              SizedBox(
                height: 16,
              ),
              UsersListWidget(
                horizontal: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
