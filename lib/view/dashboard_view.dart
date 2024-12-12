import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1F4A9B); // Blue color

    return Scaffold(
      backgroundColor: const Color(0xFF1F4A9B), // Changed to black background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            'assets/images/skillseeklogo.png',
            fit: BoxFit.contain,
            height: 100,
            width: 100,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 18,
            child: const Icon(
              Icons.person,
              color: primaryColor,
              size: 20,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                  borderSide: const BorderSide(color: Color(0xFFF8F8F8), width: 2),
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
              margin: const EdgeInsets.only(top: 100),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 13, 29, 77),
                    blurRadius: 15.0,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    _buildSkillCard('Plumber',
                        'assets/images/Plumber with tools repairing a pipe.png'),
                    _buildSkillCard('Painter',
                        'assets/images/The painter paints the wall.png'),
                    _buildSkillCard('Carpenter',
                        'assets/images/Working with a chainsaw.png'),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add_location_alt,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 255, 255, 255), // Changed BottomAppBar color to black
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: primaryColor),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart, color: primaryColor),
              onPressed: () {},
            ),
            const SizedBox(width: 38),
            IconButton(
              icon: const Icon(Icons.settings, color: primaryColor),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, color: primaryColor),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Neutral background for cards
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(210, 117, 118, 118),
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
               // Blue text for better readability
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
