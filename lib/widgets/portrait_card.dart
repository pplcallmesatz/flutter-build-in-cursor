import 'package:flutter/material.dart';

class PortraitCard extends StatefulWidget {
  final String photoUrl;
  final bool isVerified;
  final String userId;
  final String name;
  final int age;
  final String location;
  final bool initialLiked;
  final Function(bool) onLikeChanged;

  const PortraitCard({
    Key? key,
    required this.photoUrl,
    this.isVerified = false,
    required this.userId,
    required this.name,
    required this.age,
    required this.location,
    this.initialLiked = false,
    required this.onLikeChanged,
  }) : super(key: key);

  @override
  _PortraitCardState createState() => _PortraitCardState();
}

class _PortraitCardState extends State<PortraitCard> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.initialLiked;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
    widget.onLikeChanged(_isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE4E4E4)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(widget.photoUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (widget.isVerified)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.verified,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  widget.userId,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                          color: Color(0xFF2D282E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      ', ${widget.age}yrs',
                      style: const TextStyle(
                        color: Color(0xFF69646A),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  widget.location,
                  style: const TextStyle(color: Color(0xFF69646A), fontSize: 12, fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: _toggleLike,
              child: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Theme.of(context).primaryColor : const Color(0xFF413C3C),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
