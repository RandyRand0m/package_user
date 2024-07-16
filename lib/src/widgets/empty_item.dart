import 'package:flutter/material.dart';

class ListItemSkeleton extends StatelessWidget {
  const ListItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6), // Отступ между элементами списка
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16), // Отступы по краям
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(0, 0, 0, 0), width: 1),
            color: Color.fromRGBO(245, 245, 245, 1), // Цвет заглушки
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
                      width: 150,
                      height: 22,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 22,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 181, 255),
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 16,
                  ),
                  SizedBox(width: 12), // Отступ между картинкой и текстом
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
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