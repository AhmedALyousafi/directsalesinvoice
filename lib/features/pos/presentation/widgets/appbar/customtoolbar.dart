import 'package:flutter/material.dart';

class CustomToolBar extends StatelessWidget {
  const CustomToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'سجل',
                style: TextStyle(fontSize: 11.5),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down,
                  color: Colors.blue, size: 20), // أيقونة زرقاء
            ],
          ),
          SizedBox(width: 20),
          Row(
            children: [
              Text(
                'إستعلام',
                style: TextStyle(fontSize: 11.5),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down, color: Colors.blue, size: 20),
            ],
          ),
          SizedBox(width: 20),
          Row(
            children: [
              Text(
                'إجراء',
                style: TextStyle(fontSize: 11.5),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down, color: Colors.blue, size: 20),
            ],
          ),
          SizedBox(width: 20),
          Row(
            children: [
              Text(
                'تحرير',
                style: TextStyle(fontSize: 11.5),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down, color: Colors.blue, size: 20),
            ],
          ),
          SizedBox(width: 20),
          Row(
            children: [
              Text(
                'عمليات',
                style: TextStyle(fontSize: 11.5),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down, color: Colors.blue, size: 20),
            ],
          ),
          SizedBox(width: 20),
          Row(
            children: [
              Text(
                'مساعدة',
                style: TextStyle(fontSize: 11.5),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down, color: Colors.blue, size: 20),
            ],
          ),
          Spacer(),
          Icon(Icons.save, color: Colors.green),
          SizedBox(width: 10),
          Icon(Icons.autorenew),
        ],
      ),
    );
  }
}
