import 'package:flutter/material.dart';

class NearestEntryPlaceholder extends StatelessWidget {
  const NearestEntryPlaceholder({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Center(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 6), // Отступ между элементами списка
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16), // Отступы по краям
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          border: Border.all(color: const Color.fromARGB(0, 0, 0, 0), width: 1),
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    height: 22,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 244, 234, 255),
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8), // Отступ между строкой с названием и строкой со статусом
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 181, 255),
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 181, 255),
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 244, 234, 255),
                  radius: 24,
                ),
                const SizedBox(width: 12), // Отступ между картинкой и текстом
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 18,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 244, 234, 255),
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}