import 'package:c06_pas_pbp/model/faq_rec.dart';
import 'package:flutter/material.dart';

class FAQDetailPage extends StatelessWidget {
  final FaqRecommendations faqRecommendations;
  const FAQDetailPage({super.key, required this.faqRecommendations});

  @override
  Widget build(BuildContext context) {
    final titleFAQ = Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          faqRecommendations.fields.title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final descriptionFAQ = Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(
          faqRecommendations.fields.description,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        backgroundColor: Color(0xffAA8B56),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [titleFAQ, descriptionFAQ],
        ),
      ),
    );
  }
}
