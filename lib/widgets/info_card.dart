import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int count;
  final int sentCount;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color countColor;

  const InfoCard({
    Key? key,
    required this.title,
    required this.count,
    required this.sentCount,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.countColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDDDDDD), width: 1),
      ),
      child: SizedBox(
        height: 100, // Minimum height
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 12),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [iconColor.withOpacity(0), iconColor],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      icon,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF69646A),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          count.toString(),
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: countColor,
                            height: 1,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            'Received',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF69646A),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'You sent $sentCount requests',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF69646A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
