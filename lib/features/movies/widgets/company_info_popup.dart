import 'package:flutter/material.dart';

void showCompanyInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Company Information'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: {
          'Company': 'Geeksynergy Technologies Pvt Ltd',
          'Address': 'Sanjayanagar, Bengaluru-56',
          'Phone': 'XXXXXXXXX09',
          'Email': 'xxxxxx@gmail.com'
        }.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                // Key column
                Expanded(
                  flex: 2, // Control the space taken by the key
                  child: Text(
                    '${entry.key}:',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold), // Bold keys for emphasis
                  ),
                ),
                // Value column
                Expanded(
                  flex: 3, // Control the space taken by the value
                  child: Text('${entry.value}'),
                ),
              ],
            ),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    ),
  );
}
