import 'package:flutter/material.dart';
import 'package:myapp/src/features/account/router/account_router.dart';
import 'package:myapp/src/network/model/user.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/widgets/card/card.dart';
import 'package:myapp/widgets/common/nav_icon.dart';

class AccountUserCard extends StatelessWidget {
  const AccountUserCard({required this.user, Key? key}) : super(key: key);
  final MUser user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AccountCoordinator.showProfile(context);
      },
      child: XCard(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Hello' + ',',
                    style: TextStyle(color: XColors.textSecondary),
                  ),
                  Text(
                    user.name ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            XNavIcon(),
          ],
        ),
      ),
    );
  }
}
