import 'package:flutter/material.dart';
import 'package:skillseek/view/about.dart';
import 'package:skillseek/view/profile.dart';
import 'package:skillseek/view/setting.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0; // Index for Bottom Navigation

  // List of pages for each BottomNavigationBarItem
  final List<Widget> _pages = [
    const HomeScreen(),
    const Setting(),
    const ProfileScreen(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1F4A9B); // Blue color
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF1F4A9B),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
          child: Image.asset(
            'assets/images/skillseeklogo.png',
            fit: BoxFit.contain,
            height: screenWidth * 0.2, // Responsive logo size
            width: screenWidth * 0.2, // Responsive logo size
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: primaryColor),
            onPressed: () {},
          ),
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/person.png'),
            backgroundColor: Colors.transparent,
          )
        ],
      ),
      body: _pages[_currentIndex], // Show the current page from the list
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: screenHeight * 0.05, right: screenWidth * 0.02),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {},
          child: const Icon(
            Icons.add_location_alt,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Current selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update index on tap
          });
        },
        type: BottomNavigationBarType.fixed, // Ensures all items show
        selectedItemColor: primaryColor,
        unselectedItemColor: const Color.fromARGB(255, 8, 8, 8),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1F4A9B);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04, vertical: 8.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search, color: primaryColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    const BorderSide(color: Color(0xFFF8F8F8), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: primaryColor, width: 2.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: screenHeight * 0.1),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 22, 38, 86),
                  blurRadius: 15.0,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: GridView.count(
                crossAxisCount: screenWidth > 600 ? 4 : 3, // Responsive grid
                crossAxisSpacing: screenWidth * 0.05, // Responsive spacing
                mainAxisSpacing: screenWidth * 0.05, // Responsive spacing
                children: [
                  _buildSkillCard('Plumber',
                      'assets/images/Plumber with tools repairing a pipe.png'),
                  _buildSkillCard('Painter',
                      'assets/images/The painter paints the wall.png'),
                  _buildSkillCard(
                      'Carpenter', 'assets/images/Working with a chainsaw.png'),
                  _buildSkillCard('Chef',
                      'assets/images/Cook making a halloween dinner.png'),
                  _buildSkillCard('Cleaner',
                      'assets/images/Man cleans and pours cleaning agent into a bucket(1).png'),
                  _buildSkillCard('Electrician',
                      'assets/images/Man upgrading the system unit of a computer with a new graphic card.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Skill Card Widget
  Widget _buildSkillCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(210, 117, 117, 118),
            blurRadius: 30,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF1F4A9B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
