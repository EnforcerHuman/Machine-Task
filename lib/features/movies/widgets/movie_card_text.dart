import 'package:flutter/widgets.dart';

class MovieCardText extends StatelessWidget {
  const MovieCardText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 12),
      maxLines: 1,
    );
  }
}
