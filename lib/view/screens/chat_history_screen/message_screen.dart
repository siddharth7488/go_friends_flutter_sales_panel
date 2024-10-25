import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/model/chat_models/chat_history_model.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/view/widgets/chat_widgets/chat_appbar.dart';
import 'package:gofreindsgo_sales/view_model/chats/chat_history_viewmodel.dart';
import 'package:gofreindsgo_sales/view_model/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final String title;

  const ChatScreen({super.key, required this.title});
  // ChatScreen();

  @override
  Widget build(BuildContext context) {
    final providerss = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.09, context)),
          child: ChatAppbar(
            title: title,
          )),
      body: FutureBuilder(
        future:
            Provider.of<ChatProvider>(context, listen: false).loadMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                if (chatProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Reverse the messages list to show the latest message first
                final reversedMessages =
                    chatProvider.messages.reversed.toList();

                return ListView.builder(
                  itemCount: reversedMessages.length,
                  reverse:
                      true, // This will make the ListView scroll with the last item first
                  itemBuilder: (context, index) {
                    ChatMessage message = reversedMessages[index];
                    bool isSent = message.fromId ==
                        providerss.profileResponse!.data.user.id;
                    final alignment = isSent
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: alignment,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: AppColors.gradientColors,
                                  end: Alignment.topRight,
                                  begin: Alignment.bottomLeft),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              message.body,
                              style: const TextStyle(
                                  fontSize: 17, color: AppColors.whiteColor),
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
