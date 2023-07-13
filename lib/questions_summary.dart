import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor(Map<String, Object> data) {
      if (data["correct_answer"] == data["user_answer"]) {
        return const Color.fromARGB(255, 140, 231, 175);
      } else {
        return const Color.fromARGB(255, 253, 165, 159);
      }
    }

    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getBackgroundColor(data),
                  ),
                  child: Text(
                    ((data["question_index"] as int) + 1).toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data["question"] as String,
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                        Text(
                          data["user_answer"] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 253, 165, 159),
                          ),
                        ),
                        Text(
                          'Respuesta correcta: ${data["correct_answer"] as String}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 140, 231, 175),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
