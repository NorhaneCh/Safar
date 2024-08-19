// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:frontend/core/colors.dart';
// import 'package:frontend/logic/chatbot/chatbot_cubit.dart';
// import 'package:frontend/logic/chatbot/chatbot_state.dart';
// import 'package:loading_indicator/loading_indicator.dart';

// class ChatPage extends StatefulWidget {
//   @override
//   const ChatPage({super.key});

//   @override
//   State<ChatPage> createState() => _ChatPage();
// }

// class _ChatPage extends State<ChatPage> {
//   String generatedText = '';

//   bool isListening = false;

//   List prompts = [];
//   List responses = [];
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return BlocBuilder<ChatbotCubit, ChatbotStates>(
//       builder: (context, state) {
//         final chatbotCubit = context.read<ChatbotCubit>();
//         return GestureDetector(
//             onTap: () {
//               if (!ChatbotCubit.isLoading) {
//                 FocusScope.of(context).unfocus();
//               }
//             },
//             child: Scaffold(
//                 body: Container(
//               height: height * 0.92,
//               child: Column(
//                 children: [
//                   Container(
//                     height: 90,
//                     padding: EdgeInsets.only(top: height * 0.07),
//                     child: const Center(
//                         child: Text(
//                       "Welcome! SafarBot will help you",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Poppins',
//                         color: AppColors.kSecondaryColor,
//                       ),
//                     )),
//                   ),
//                   Expanded(
//                     child: ListView.separated(
//                         reverse: true,
//                         itemBuilder: (BuildContext context, index) {
//                           return (!(index == 0))
//                               ? Column(
//                                   children: [
//                                     Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Container(
//                                         margin: EdgeInsets.fromLTRB(
//                                             0, 0, width * 0.02, height * 0.02),
//                                         padding: EdgeInsets.all(width * 0.035),
//                                         decoration: BoxDecoration(
//                                             color: AppColors.kPrimaryColor,
//                                             borderRadius:
//                                                 BorderRadius.circular(10)),
//                                         width: width * 0.9,
//                                         child: Text(
//                                           ChatbotCubit.questions[index - 1],
//                                           style: const TextStyle(
//                                             color: AppColors.kFourthColor,
//                                             fontSize: 18,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Container(
//                                         margin: EdgeInsets.fromLTRB(
//                                             width * 0.02, 0, 0, height * 0.02),
//                                         padding: EdgeInsets.all(width * 0.035),
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius: BorderRadius.circular(
//                                                 width * 0.035),
//                                             border: Border.all(
//                                                 width: 1,
//                                                 color:
//                                                     const Color(0xFFDADADA))),
//                                         width: width * 0.75,
//                                         child: Text(
//                                           ChatbotCubit.responses[index - 1],
//                                           style: const TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18,
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               : Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Container(
//                                     margin: EdgeInsets.fromLTRB(
//                                         0, 0, width * 0.02, height * 0.02),
//                                     padding: EdgeInsets.all(width * 0.035),
//                                     decoration: BoxDecoration(
//                                         color: AppColors.kPrimaryColor,
//                                         borderRadius:
//                                             BorderRadius.circular(10)),
//                                     width: width * 0.9,
//                                     child: TextField(
//                                       maxLines: null,
//                                       cursorColor: AppColors.kFourthColor,
//                                       decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                           hintText: "tap here",
//                                           hintStyle: TextStyle(
//                                             color:
//                                                 Colors.black.withOpacity(0.4),
//                                           )),
//                                       controller:
//                                           ChatbotCubit.messageController,
//                                       style: const TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 18,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                         },
//                         separatorBuilder: (BuildContext context, index) {
//                           return const SizedBox(
//                             height: 0,
//                           );
//                         },
//                         itemCount: ChatbotCubit.questions.length + 1),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         onTap: () async {
//                           if (!isLoading) {
//                             chatbotCubit.sendRequest(context);
//                             //interstitialAd!.show();
//                           }
//                         },
//                         child: (!ChatbotCubit.isLoading)
//                             ? Material(
//                                 elevation: 10.0,
//                                 shadowColor: AppColors.kPrimaryColor,
//                                 shape: const CircleBorder(),
//                                 child: CircleAvatar(
//                                   radius: width * 0.07,
//                                   backgroundColor: (!isLoading)
//                                       ? Colors.white
//                                       : Colors.grey[700],
//                                   child: const Icon(
//                                     Icons.send,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               )
//                             : Container(
//                                 height: width * 0.11,
//                                 width: width * 0.11,
//                                 child: const LoadingIndicator(
//                                   indicatorType: Indicator.circleStrokeSpin,
//                                   colors: [AppColors.kPrimaryColor],
//                                   strokeWidth: 2,
//                                 ),
//                               ),
//                       ),
//                       SizedBox(
//                         width: width * 0.04,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )));
//       },
//     );
//   }
// }

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/colors.dart';
import 'package:frontend/core/images.dart';
import 'package:frontend/shared/request.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatUser current = ChatUser(
    firstName: "Current User",
    id: "0",
    profileImage: AppImages.user,
  );

  ChatUser bot = ChatUser(
    firstName: "SafarBot",
    id: "1",
    profileImage: AppImages.mascot,
  );

  List<ChatMessage> messages = [];
  final ChatService chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SafarBot'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return DashChat(
        currentUser: current, onSend: _sendMessage, messages: messages);
  }

  void _sendMessage(ChatMessage message) async {
    setState(() {
      messages = [message, ...messages];
    });

    try {
      String question = message.text;

      List<Map<String, String>> prompt = [
        {"role": "user", "content": question}
      ];

      final botResponse = await chatService.sendMessageToBot(prompt);

      if (botResponse != null && botResponse.isNotEmpty) {
        ChatMessage botMessage = ChatMessage(
          text: botResponse,
          user: bot,
          createdAt: DateTime.now(),
        );

        setState(() {
          messages = [botMessage, ...messages];
        });
      } else {
        ChatMessage botMessage = ChatMessage(
          text: "Sorry, I couldn't understand that. Please try again.",
          user: bot,
          createdAt: DateTime.now(),
        );
        setState(() {
          messages = [botMessage, ...messages];
        });
      }
    } catch (e) {
      print('Error: $e');

      ChatMessage botMessage = ChatMessage(
        text: "An error occurred. Please try again later.",
        user: bot,
        createdAt: DateTime.now(),
      );
      setState(() {
        messages.add(botMessage);
      });
    }
  }
}
