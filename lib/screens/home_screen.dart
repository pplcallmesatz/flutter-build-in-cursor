import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/info_card.dart';
import '../widgets/profile_card.dart';
import '../widgets/portrait_card.dart';
import '../widgets/dot_indicator.dart';
import 'new_matches_screen.dart';
import 'filter_screen.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  final List<Map<String, String>> _nearbyMatches = List.generate(10, (index) {
    final random = Random();
    final age = 20 + random.nextInt(20);
    final height = 150 + random.nextInt(30);
    final cities = ['Erode', 'Chennai', 'Coimbatore', 'Madurai', 'Salem'];
    final professions = [
      'Software Engineer',
      'Teacher',
      'Doctor',
      'Designer',
      'Entrepreneur'
    ];
    final degrees = ['BE', 'BTech', 'MBA', 'MCA', 'BBA'];

    return {
      'photoUrl': 'https://picsum.photos/200?random=$index',
      'userId': 'USER${100000 + index}',
      'userName': 'User ${index + 1}',
      'userDetails':
          '$age yr, ${height}cm, ${cities[random.nextInt(cities.length)]}, Tamil Nadu, India, ${professions[random.nextInt(professions.length)]}, ${degrees[random.nextInt(degrees.length)]}',
    };
  });

  final List<Map<String, dynamic>> _newMatches = List.generate(8, (index) {
    final random = Random();
    return {
      'photoUrl': 'https://picsum.photos/200?random=${index + 200}',
      'isVerified': random.nextBool(),
      'userId': 'D${900000 + random.nextInt(99999)}',
      'name': 'User ${index + 1}',
      'age': 20 + random.nextInt(20),
      'location': '${[
        'Chennai',
        'Coimbatore',
        'Madurai',
        'Salem',
        'Tiruchirapalli'
      ][random.nextInt(5)]}, Tamil Nadu',
    };
  });

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(
                hasNewNotification: true,
                onProfileTap: () => print('Profile tapped'),
                onSearchTap: () => print('Search tapped'),
                onFilterTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FilterScreen()),
                  );
                },
                onNotificationTap: () => print('Notification tapped'),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildProfilePercentageCard(context),
                    InfoCard(
                      title: 'Phone number',
                      count: 5,
                      sentCount: 3,
                      icon: Icons.phone,
                      backgroundColor: const Color(0xFFD6E4F5),
                      iconColor: const Color(0xFF167FFD),
                      countColor: const Color(0xFF549AEF),
                    ),
                    InfoCard(
                      title: 'Photo request',
                      count: 8,
                      sentCount: 2,
                      icon: Icons.person,
                      backgroundColor: const Color(0xFFE5F3E5),
                      iconColor: const Color(0xFF529311),
                      countColor: const Color(0xFF7ACB42),
                    ),
                    InfoCard(
                      title: 'Profile request',
                      count: 12,
                      sentCount: 5,
                      icon: Icons.person_add,
                      backgroundColor: const Color(0xFFE8CAEF),
                      iconColor: const Color(0xFFC44ADE),
                      countColor: const Color(0xFF672874),
                    ),
                    InfoCard(
                      title: 'Horoscope request',
                      count: 3,
                      sentCount: 1,
                      icon: FontAwesomeIcons.star,
                      backgroundColor: const Color(0xFFEFDAC1),
                      iconColor: const Color(0xFFED8100),
                      countColor: const Color(0xFFEB9C3E),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '6 Matching Profiles',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 140,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ProfileCard(
                        photoUrl:
                            'https://picsum.photos/200?random=${index + 100}',
                        userId: 'USER${100000 + index}',
                        userName: 'User ${index + 1}',
                        userDetails:
                            '23yr, 5ft 3in/160cm, Erode, Tamil Nadu, India, Software Professional, BE',
                        onShortlist: () => print('Shortlist User ${index + 1}'),
                        onExpressInterest: () =>
                            print('Express Interest User ${index + 1}'),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: DotIndicator(
                  itemCount: 6,
                  currentIndex: _currentPage,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'New matches for you',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _newMatches.length + 1,
                  itemBuilder: (context, index) {
                    if (index < _newMatches.length) {
                      final match = _newMatches[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 16 : 0,
                          right: 20,
                        ),
                        child: SizedBox(
                          width: 180,
                          child: PortraitCard(
                            photoUrl: match['photoUrl'],
                            isVerified: match['isVerified'],
                            userId: match['userId'],
                            name: match['name'],
                            age: match['age'],
                            location: match['location'],
                            initialLiked: false,
                            onLikeChanged: (isLiked) {
                              print('User ${match['name']} liked: $isLiked');
                            },
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewMatchesScreen(newMatches: _newMatches),
                              ),
                            );
                          },
                          child: Container(
                            width: 160,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Show all profiles',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Nearby matches',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _nearbyMatches.length,
                itemBuilder: (context, index) {
                  final match = _nearbyMatches[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ProfileCard(
                      photoUrl: match['photoUrl']!,
                      userId: match['userId']!,
                      userName: match['userName']!,
                      userDetails: match['userDetails']!,
                      onShortlist: () =>
                          print('Shortlist Nearby User ${index + 1}'),
                      onExpressInterest: () =>
                          print('Express Interest Nearby User ${index + 1}'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePercentageCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 100,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDDDDDD), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 3,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
                Text(
                  '75%',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Complete your profile now',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D282E),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Get one step closer to finding your perfect match.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF69646A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
