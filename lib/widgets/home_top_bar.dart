import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  final bool hasNewNotification;
  final VoidCallback onProfileTap;
  final VoidCallback onSearchTap;
  final VoidCallback onFilterTap;
  final VoidCallback onNotificationTap;

  const HomeTopBar({
    Key? key,
    required this.hasNewNotification,
    required this.onProfileTap,
    required this.onSearchTap,
    required this.onFilterTap,
    required this.onNotificationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onProfileTap,
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: onSearchTap,
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: onFilterTap,
              ),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: onNotificationTap,
                  ),
                  if (hasNewNotification)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
