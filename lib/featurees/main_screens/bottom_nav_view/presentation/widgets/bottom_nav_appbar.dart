import 'package:flutter/material.dart';

class BottomNavAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onNotificationPressed;

  const BottomNavAppBar({
    super.key,
    required this.title,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      // color: Colors.transparent, // مثل AppBar
      child:
          // عناصر اليمين
          Row(
            children: [
              SizedBox(width: 70),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.black),
                onPressed: onNotificationPressed,
              ),
              const SizedBox(width: 16),
              const CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=3',
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
    );
  }
}
