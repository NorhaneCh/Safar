import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  final String apiKey = 'up_ojYLD2p0mj0lddfEiZdQkKJDRvQ0T';
  final String apiUrl = 'https://api.upstage.ai/v1/solar';

  Future<String?> sendMessageToBot(List<Map<String, String>> messages) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'solar-1-mini-chat',
          'messages': messages,
          'stream': false,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['choices'] != null && data['choices'] is List) {
          final message = data['choices'][0]['message']['content'];
          return message;
        }
      } else {
        print('Failed to connect: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
