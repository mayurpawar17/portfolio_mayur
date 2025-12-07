import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// small helpers
Widget sectionTitle(String t) {
  return Text(
    t,
    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
  );
}

Widget sectionWrapper({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
    child: child,
  );
}

void scrollTo(int index, ItemScrollController scrollController) {
  scrollController.scrollTo(
    index: index,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeInOutCubic,
    alignment: 0.05,
  );
}
