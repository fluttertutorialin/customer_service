import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/chats_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  _conversationsList() => ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 0);
      },
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) => ChatsWidget());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('chat'.tr,
                style: Get.textTheme.headline6!
                    .merge(const TextStyle(fontSize: 18))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            iconTheme:
            IconThemeData(color: context.theme.hintColor),
            leading: IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () => {Scaffold.of(context).openDrawer()})),
        body: _conversationsList());
  }
}
