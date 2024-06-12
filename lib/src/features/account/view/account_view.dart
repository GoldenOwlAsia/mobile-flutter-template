import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/core/widgets/appbar/large_title_appbar.dart';
import 'package:myapp/src/core/widgets/card/card.dart';
import 'package:myapp/src/core/widgets/card/card_section.dart';
import 'package:myapp/src/features/account/cubit/account_cubit.dart';
import 'package:myapp/src/features/account/widgets/account_nouser_cart.dart';
import 'package:myapp/src/features/account/widgets/account_user_card.dart';

class AccountHomeView extends StatelessWidget {
  const AccountHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 15);
    return BlocBuilder<AccountCubit, AccountState>(
        builder: (context, AccountState state) {
      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const LargeTitleAppBar('Account', paddingTop: 0),
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (state.isLogin) ...[
                        AccountUserCard(user: state.user),
                      ] else ...[
                        const AccountNoUserCard(),
                      ],
                      space,
                      XCard(
                        padding: EdgeInsets.zero,
                        child: XCardSectionButton(
                          title: 'Policy',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
