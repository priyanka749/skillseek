// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:skillseek/app/di/di.dart';
// import 'package:skillseek/features/service_provider/presentation/view/services_provider.dart';
// import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_bloc.dart';
// import 'package:skillseek/features/servicesavailable/presentation/view/service_available_view.dart';
// import 'package:skillseek/features/user/domain/usecase/user_usecase.dart';
// import 'package:skillseek/features/user/presentation/view/user_view.dart';
// import 'package:skillseek/features/user/presentation/view_more/user_bloc.dart';
// import 'package:skillseek/features/user/presentation/view_more/user_event.dart';
// import 'package:skillseek/view/about.dart';
// import 'package:skillseek/view/setting.dart';

// class DashboardView extends StatefulWidget {
//   const DashboardView({super.key});

//   @override
//   State<DashboardView> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends State<DashboardView> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     const HomeScreen(),
//     const Setting(),
//     const ServiceListScreen(),
//     const AboutScreen(), // ✅ Navigate to About Page
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 4,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.asset(
//             'assets/images/skillseeklogo.png',
//             fit: BoxFit.contain,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Color(0xFF1F4A9B)),
//             onPressed: () {},
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BlocProvider(
//                     create: (context) => CustomerBloc(getIt<CustomerUseCases>())
//                       ..add(
//                           FetchCustomersEvent()), // ✅ Ensure event is triggered
//                     child: const CustomerScreen(),
//                   ),
//                 ),
//               );
//             },
//             child: const CircleAvatar(
//               radius: 18,
//               backgroundImage: AssetImage('assets/images/person.png'),
//               backgroundColor: Colors.transparent,
//             ),
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//       body: _pages[_currentIndex], // ✅ Switch Pages Dynamically
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index; // ✅ Update Index
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: const Color(0xFF1F4A9B),
//         unselectedItemColor: const Color.fromARGB(255, 13, 13, 13),
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.design_services_sharp), label: 'Services'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.info), label: 'About'), // ✅ About Page
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               hintText: 'Search here',
//               prefixIcon: const Icon(Icons.search, color: Color(0xFF1F4A9B)),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(25),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding: const EdgeInsets.symmetric(vertical: 16),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
//             ),
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // "Today's Deal" section with gradient background
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [Color(0xFF1F4A9B), Color(0xFF62A4D7)],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: const Color.fromARGB(255, 94, 93, 93)
//                                 .withOpacity(0.5),
//                             blurRadius: 15,
//                             offset: const Offset(0, 6),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Today's Deal",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 "50% OFF",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               foregroundColor: const Color(0xFF1F4A9B),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               padding: screenWidth < 600
//                                   ? const EdgeInsets.symmetric(
//                                       vertical: 12, horizontal: 16)
//                                   : const EdgeInsets.symmetric(
//                                       vertical: 16, horizontal: 32),
//                               shadowColor: const Color(0xFF1F4A9B),
//                               elevation: 6,
//                             ),
//                             onPressed: () {},
//                             child: const Text('BOOK NOW'),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const SectionHeader(title: 'Service categories'),
//                     const SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           FreelancerCard(
//                             name: 'Plumber',
//                             imagePath:
//                                 'assets/images/Plumber with tools repairing a pipe.png',
//                           ),
//                           FreelancerCard(
//                             name: 'Electrician',
//                             imagePath:
//                                 'assets/images/Man upgrading the system unit of a computer with a new graphic card.png',
//                           ),
//                           FreelancerCard(
//                             name: 'Mechanic',
//                             imagePath:
//                                 'assets/images/Man cleans and pours cleaning agent into a bucket(1).png',
//                           ),
//                           FreelancerCard(
//                             name: 'Painter',
//                             imagePath:
//                                 'assets/images/The painter paints the wall.png',
//                           ),
//                           FreelancerCard(
//                             name: 'Carpenter',
//                             imagePath:
//                                 'assets/images/Working with a chainsaw.png',
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const SectionHeader(title: 'Top Services'),
//                     const Column(
//                       children: [
//                         ServiceCard(
//                           name: 'Plumber',
//                           rating: 4.9,
//                           description:
//                               'Highly experienced in plumbing services.',
//                           imagePath:
//                               'assets/images/Plumber with tools repairing a pipe.png',
//                         ),
//                         ServiceCard(
//                           name: 'painter',
//                           rating: 4.7,
//                           description:
//                               'Expert in electrical installations and repairs.',
//                           imagePath:
//                               'assets/images/The painter paints the wall.png',
//                         ),
//                         ServiceCard(
//                           name: 'Carpenter',
//                           rating: 4.8,
//                           description:
//                               'Reliable mechanic for all vehicle needs.',
//                           imagePath:
//                               'assets/images/Working with a chainsaw.png',
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class SectionHeader extends StatelessWidget {
//   final String title;

//   const SectionHeader({required this.title, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF1F4A9B),
//           ),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: const Text('View All'),
//         ),
//       ],
//     );
//   }
// }

// class FreelancerCard extends StatelessWidget {
//   final String name;
//   final String imagePath;

//   const FreelancerCard({
//     required this.name,
//     required this.imagePath,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(right: 16),
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: const Color(0xFF1F4A9B),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color.fromARGB(255, 14, 13, 13).withOpacity(0.4),
//                   blurRadius: 12,
//                   offset: const Offset(0, 6),
//                 ),
//               ],
//             ),
//             child: CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage(imagePath),
//               backgroundColor: Colors.transparent,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             name,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ServiceCard extends StatelessWidget {
//   final String name;
//   final double rating;
//   final String description;
//   final String imagePath;

//   const ServiceCard({
//     required this.name,
//     required this.rating,
//     required this.description,
//     required this.imagePath,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: const Color.fromARGB(255, 14, 13, 13).withOpacity(0.3),
//             blurRadius: 12,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Color(0xFF1F4A9B),
//             ),
//             child: CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage(imagePath),
//               backgroundColor: Colors.transparent,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   description,
//                   style: const TextStyle(
//                     color: Color.fromARGB(255, 86, 86, 86),
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Icon(Icons.star, color: Colors.amber, size: 14),
//                   Text('$rating'),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => BlocProvider.value(
//                         value: context.read<
//                             ServiceProviderBloc>(), // ✅ Ensure correct Bloc instance is passed
//                         child: const ServiceProviderScreen(),
//                       ),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF1F4A9B),
//                   foregroundColor: Colors.white,
//                 ),
//                 child: const Text('Book Now'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/app/di/di.dart';
import 'package:skillseek/features/service_provider/presentation/view/services_provider.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_bloc.dart';
import 'package:skillseek/features/servicesavailable/domain/usecase/serviceavailable_usecase.dart';
import 'package:skillseek/features/servicesavailable/presentation/view/service_available_view.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_bloc.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_event.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_state.dart';
import 'package:skillseek/features/user/domain/usecase/user_usecase.dart';
import 'package:skillseek/features/user/presentation/view/user_view.dart';
import 'package:skillseek/features/user/presentation/view_more/user_bloc.dart';
import 'package:skillseek/features/user/presentation/view_more/user_event.dart';
import 'package:skillseek/view/about.dart';
import 'package:skillseek/view/setting.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Setting(),
    const ServiceListScreen(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 244, 250, 254), // Light blue background
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 6,
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => CustomerBloc(getIt<CustomerUseCases>())
                      ..add(FetchCustomersEvent()),
                    child: const CustomerScreen(),
                  ),
                ),
              );
            },
            child: const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/person.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(width: screenWidth < 600 ? 8 : 12),
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
        backgroundColor: const Color(0xFF1F4A9B),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        elevation: 8,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services_sharp), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth < 600 ? 16.0 : 30.0;

    return BlocProvider(
      create: (context) =>
          ServiceBloc(getIt<GetServices>())..add(FetchServices()),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search here',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF1F4A9B)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(color: Color(0xFF1F4A9B), width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(color: Color(0xFF1F4A9B), width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(color: Color(0xFF1F4A9B), width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.errorMessage.isNotEmpty) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state.services.isEmpty) {
                    return const Center(child: Text("No services available"));
                  } else {
                    final filteredServices = state.services.where((service) {
                      return service.title.toLowerCase().contains(_searchQuery);
                    }).toList();

                    if (filteredServices.isEmpty && _searchQuery.isNotEmpty) {
                      return const Center(
                          child: Text("No matching services found"));
                    }

                    return SingleChildScrollView(
                      child: Padding(
                        padding:
                            EdgeInsets.all(padding + 4), // Increased padding
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(padding * 0.75),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF1F4A9B),
                                    Color(0xFF42A5F5)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 15,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Today's Deal",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth < 600 ? 16 : 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "50% OFF",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth < 600 ? 22 : 26,
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
                                              vertical: 8, horizontal: 12)
                                          : const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                      shadowColor: const Color(0xFF1F4A9B),
                                      elevation: 6,
                                    ),
                                    onPressed: () {},
                                    child: const Text('BOOK NOW'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: padding),
                            const SectionHeader(title: 'Service Categories'),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: padding * 0.5,
                                    horizontal:
                                        padding * 10), // Increased padding
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children:
                                    filteredServices.take(5).map((service) {
                                  return FreelancerCard(
                                    name: service.title
                                        .replaceAll('Available ', ''),
                                    imagePath: _getFullImageUrl(service.image),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(height: padding),
                            const SectionHeader(title: 'Top Services'),
                            Column(
                              children: filteredServices.take(7).map((service) {
                                return ServiceCard(
                                  name: service.title
                                      .replaceAll('Available ', ''),
                                  rating: 4.8,
                                  description: service.description,
                                  imagePath: _getFullImageUrl(service.image),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getFullImageUrl(String imagePath) {
    String baseUrl = "http://10.0.2.2:3000";
    if (imagePath.startsWith("http")) {
      return imagePath;
    }
    return "$baseUrl$imagePath";
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth < 600 ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1F4A9B),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'View All',
            style: TextStyle(
              color: const Color(0xFF1F4A9B),
              fontSize: screenWidth < 600 ? 14 : 16,
            ),
          ),
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF1F4A9B), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: screenWidth < 600 ? 30 : 30,
              backgroundImage: NetworkImage(imagePath),
              backgroundColor: Colors.black,
              onBackgroundImageError: (_, __) => const Icon(Icons.broken_image),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth < 600 ? 12 : 14,
              color: Colors.black,
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(screenWidth < 600 ? 14 : 20), // Increased padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 60, 60, 60).withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF1F4A9B), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 52, 52, 52).withOpacity(0.4),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: screenWidth < 600 ? 30 : 30,
              backgroundImage: NetworkImage(imagePath),
              backgroundColor: Colors.transparent,
              onBackgroundImageError: (_, __) => const Icon(Icons.broken_image),
            ),
          ),
          SizedBox(width: screenWidth < 600 ? 12 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Clear black for high contrast
                  ),
                ),
                const SizedBox(height: 10), // Increased spacing for clarity
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.normal,
                    // Slightly lighter black for contrast
                    fontSize: screenWidth < 600 ? 12 : 15,
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
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(
                    '$rating',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth < 800 ? 13 : 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: context.read<ServiceProviderBloc>(),
                        child: const ServiceProviderScreen(),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F4A9B),
                  foregroundColor: Colors.white,
                  padding: screenWidth < 600
                      ? const EdgeInsets.symmetric(vertical: 2, horizontal: 8)
                      : const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 12 : 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
