import 'dart:html';

import 'package:google_generative_ai/google_generative_ai.dart';

class ImageProcess {
  Future<String?> imageProcess(String path) async {
    const apiKey = 'YOUR_API_KEY';

    final model = GenerativeModel(model: 'gemini-pro-vision', apiKey: apiKey);

    try {
      final response = await HttpRequest.request(path, responseType: 'blob');

      final prompt = TextPart(
          "Read the text from the image and check whether it is a lab test result of a medical checkup. If the image is a lab test result, extract the text from the image and display whether the patient has any result in short words after analyzing it. If the image is not a lab test result, display the message that the image is not a lab test result.");
      final imagePart = DataPart('image/jpeg', response.response);

      final content = Content.multi([prompt, imagePart]);

      final generatedContent = await model.generateContent([content]);

      if (generatedContent != null && generatedContent.text != null) {
        print(generatedContent.text);
        return generatedContent.text;
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