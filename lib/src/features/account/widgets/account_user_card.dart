import 'package:flutter/material.dart';
import 'package:myapp/src/core/router/coordinator.dart';
import 'package:myapp/src/core/theme/colors.dart';
import 'package:myapp/src/core/widgets/card/card.dart';
import 'package:myapp/src/core/widgets/common/nav_icon.dart';
import 'package:myapp/src/core/models/user/user.dart';

class AccountUserCard extends StatelessWidget {
  const AccountUserCard({required this.user, super.key});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: AppCoordinator.showProfile,
      child: XCard(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Hello' ',',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  Text(
                    user.name ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const XNavIcon(),
          ],
        ),
      ),
    );
  }
}
