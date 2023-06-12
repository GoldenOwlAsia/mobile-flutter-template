import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/chat/widget/image_avatar.dart';
import 'package:myapp/src/features/friends/logic/friends_bloc.dart';
import 'package:myapp/src/network/model/common/handle.dart';
import 'package:myapp/widgets/state/state_empty_widget.dart';
import 'package:myapp/widgets/state/state_error_widget.dart';
import 'package:myapp/widgets/state/state_loading_widget.dart';
import '../../../network/model/user/user.dart';
import '../../chat/router/chat_coordinator.dart';

class FriendsView extends StatelessWidget {
  const FriendsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FriendsBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Friends')),
        body: BlocBuilder<FriendsBloc, MHandle<List<MUser>>>(
            builder: (context, state) {
          if (state.isLoading) {
            return const XStateLoadingWidget();
          }
          if (state.isError) {
            return XStateErrorWidget(
              onTap: () {
                context.read<FriendsBloc>().loadData();
              },
            );
          }
          final data = state.data ?? [];
          if (data.isEmpty) {
            return const XStateEmptyWidget();
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              final name = item.name ?? 'User $index';
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                title: Text(name),
                leading: XAvatarImage(item.avatar, name: name, size: 54),
                onTap: () => ChatCoordinator.showChatWithUser(context, item),
              );
            },
          );
        }),
      ),
    );
  }
}
