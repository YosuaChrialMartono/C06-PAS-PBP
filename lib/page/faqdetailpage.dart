import 'package:c06_pas_pbp/model/faq_rec.dart';
import 'package:flutter/material.dart';

class FAQDetailPage extends StatelessWidget {
  final FaqRecommendations faqRecommendations;
  const FAQDetailPage({super.key, required this.faqRecommendations});

  Widget build(BuildContext context) {
    final titleFAQ = Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          faqRecommendations.fields.title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ));
    final descriptionFAQ = Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          const Text(
            "Jawaban: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(faqRecommendations.fields.description,
              style: const TextStyle(fontSize: 20)),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Column(
        children: [titleFAQ, descriptionFAQ],
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
