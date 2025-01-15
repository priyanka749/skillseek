import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Text('Settings Page'),
    const Text('Profile Page'),
    const Text('About Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/skillseeklogo.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFF1F4A9B)),
            onPressed: () {},
          ),
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/person.png'),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1F4A9B),
        unselectedItemColor: const Color.fromARGB(255, 13, 13, 13),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search here',
              prefixIcon: const Icon(Icons.search, color: Color(0xFF1F4A9B)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Today's Deal" section with gradient background
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1F4A9B), Color(0xFF62A4D7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 94, 93, 93)
                                .withOpacity(0.5),
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Deal",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "50% OFF",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF1F4A9B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: screenWidth < 600
                                  ? const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16)
                                  : const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 32),
                              shadowColor: const Color(0xFF1F4A9B),
                              elevation: 6,
                            ),
                            onPressed: () {},
                            child: const Text('BOOK NOW'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SectionHeader(title: 'Service categories'),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FreelancerCard(
                            name: 'Plumber',
                            imagePath:
                                'assets/images/Plumber with tools repairing a pipe.png',
                          ),
                          FreelancerCard(
                            name: 'Electrician',
                            imagePath:
                                'assets/images/Man upgrading the system unit of a computer with a new graphic card.png',
                          ),
                          FreelancerCard(
                            name: 'Mechanic',
                            imagePath:
                                'assets/images/Man cleans and pours cleaning agent into a bucket(1).png',
                          ),
                          FreelancerCard(
                            name: 'Painter',
                            imagePath:
                                'assets/images/The painter paints the wall.png',
                          ),
                          FreelancerCard(
                            name: 'Carpenter',
                            imagePath:
                                'assets/images/Working with a chainsaw.png',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SectionHeader(title: 'Top Services'),
                    const Column(
                      children: [
                        ServiceCard(
                          name: 'John Doe',
                          rating: 4.9,
                          description:
                              'Highly experienced in plumbing services.',
                          imagePath:
                              'assets/images/Plumber with tools repairing a pipe.png',
                        ),
                        ServiceCard(
                          name: 'Jane Smith',
                          rating: 4.7,
                          description:
                              'Expert in electrical installations and repairs.',
                          imagePath:
                              'assets/images/The painter paints the wall.png',
                        ),
                        ServiceCard(
                          name: 'Mike Johnson',
                          rating: 4.8,
                          description:
                              'Reliable mechanic for all vehicle needs.',
                          imagePath:
                              'assets/images/Working with a chainsaw.png',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F4A9B),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('View All'),
        ),
      ],
    );
  }
}

class FreelancerCard extends StatelessWidget {
  final String name;
  final String imagePath;

  const FreelancerCard({
    required this.name,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF1F4A9B),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 14, 13, 13).withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
              backgroundColor: Colors.transparent,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String name;
  final double rating;
  final String description;
  final String imagePath;

  const ServiceCard({
    required this.name,
    required this.rating,
    required this.description,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 14, 13, 13).withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF1F4A9B),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
              backgroundColor: Colors.transparent,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 86, 86, 86),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 14),
                  Text('$rating'),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F4A9B),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Book Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
