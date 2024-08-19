import 'package:flutter/material.dart';
import 'package:frontend/shared/request.dart'; // Assuming DataService is defined here
import 'chatbot_state.dart';
import 'package:bloc/bloc.dart';

class ChatbotCubit extends Cubit<ChatbotStates> {
  ChatbotCubit() : super(ChatbotInitialState());

  static List<Map<String, String>> prompts = [];
  static List<String> questions = [];
  static List<String> responses = [];
  static bool isLoading = false;
  static TextEditingController messageController = TextEditingController();
  final ChatService dataService = ChatService();

  void sendRequest(BuildContext context) async {
    String prompt = messageController.text;

    if (prompt.isEmpty) return;

    // Emit loading state
    isLoading = true;
    emit(ChatbotLoadingState());

    // Add user prompt
    prompts.add({"role": "user", "content": prompt});
    questions.insert(0, prompt); // questions is a List<String>

    try {
      // Send the request to the API
      final response = await dataService.sendMessageToBot(prompts);

      if (response != null && response.isNotEmpty) {
        responses.insert(0, response); // responses is a List<String>
        prompts.add(
            {"role": "system", "content": response}); // Add system response

        // Reset the text field and emit loaded state
        messageController.clear();
        isLoading = false;
        emit(ChatbotLoadedState());
      } else {
        _handleError(context, "Empty response from server");
      }
    } catch (e) {
      _handleError(
          context, "Error while generating response. Check connection.");
    }
  }

  void _handleError(BuildContext context, String message) {
    prompts.removeLast();
    questions.removeAt(0);
    isLoading = false;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
    emit(ChatbotErrorState());
  }
}
