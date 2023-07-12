import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_adam/view/second_screen/screen/second_screen.dart';
import 'package:suitmedia_test_adam/view/third_screen/widget/users_card_widget.dart';
import 'package:suitmedia_test_adam/view_model/third_screen/get_users_list_provider.dart';

import '../../../utils/state/finite_state.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({
    super.key,
    required double horizontal,
  }) : _horizontal = horizontal;

  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<GetUsersListProvider>(builder: (context, provider, _) {
      if (provider.state == MyState.loading) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: _horizontal,
          ),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) => const ArtikelCardWidgetLoading(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
        );
      } else if (provider.state == MyState.loaded) {
        if (provider.userList.isNotEmpty) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: _horizontal,
            ),
            shrinkWrap: true,
            itemCount: provider.userList.length,
            itemBuilder: (context, index) => Stack(
              children: [
                UserCardWidget(
                  avatar: provider.userList[index].avatar!,
                  firstName: provider.userList[index].firstName!,
                  lastName: provider.userList[index].lastName!,
                  email: provider.userList[index].email!,
                ),
                const Divider(),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        final user = provider.userList[index];
                        provider.selectUser(user);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondScreen()),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.35),
            child: Center(
              child: AutoSizeText(
                "User List Empty",
                minFontSize: 14,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          );
        }
      } else if (provider.state == MyState.failed) {
        return SizedBox(
          height: screenHeight * 0.8,
          child: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                const Icon(
                  Icons.sentiment_dissatisfied_outlined,
                  size: 40,
                  color: Colors.black54,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Something went wrong",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black54,
                      ),
                ),
              ],
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
