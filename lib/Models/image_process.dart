import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

class ImageProcess {
  Future<String?> imageProcess(String path) async {
    // final apiKey = Platform.environment['AIzaSyCWMrbbfq_WL3iWaB-74ak-LlhYYU1e7e8'];
    final apiKey = 'AIzaSyCWMrbbfq_WL3iWaB-74ak-LlhYYU1e7e8';

    // print('API_KEY: $apiKey');
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      exit(1);
    }

    final model = GenerativeModel(model: 'gemini-pro-vision', apiKey: apiKey);

    try {
      final imageBytes = await File(path).readAsBytes();

      final prompt = TextPart(
        "Read the text from the image and check weather it is a lab test result of a medical checkup if the image is a lab test result then extract the text from the image and display weather the patient has any result in short words after analysing it. If the image is not a lab test result then display the message that the image is not a lab test result.",
      );
      final imagePart = DataPart('image/jpeg', imageBytes);

      final response = await model.generateContent([
        Content.multi([prompt, imagePart])
      ]);

      if (response != null && response.text != null) {
        print(response.text);
        return response.text;
      } else {
        print('No text response received.');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
