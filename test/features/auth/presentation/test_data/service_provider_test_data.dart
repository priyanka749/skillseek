import 'package:skillseek/features/service_provider/domain/entity/service_provider_entity.dart';

class ServiceProviderTestData {
  ServiceProviderTestData._();

  static List<ServiceProviderEntity> getServiceProviderTestData() {
    return [
      const ServiceProviderEntity(
        id: "1",
        userId: "user1",
        name: "Provider 1",
        email: "provider1@example.com",
        phoneNumber: "1234567890",
        bio: "Experienced service provider",
        profileImage: "/path/to/provider1.jpg",
        location: "Location 1",
        skills: ["Skill 1", "Skill 2"],
      ),
      const ServiceProviderEntity(
        id: "2",
        userId: "user2",
        name: "Provider 2",
        email: "provider2@example.com",
        phoneNumber: "0987654321",
        bio: "Skilled and reliable",
        profileImage: "/path/to/provider2.jpg",
        location: "Location 2",
        skills: ["Skill 3", "Skill 4"],
      ),
      const ServiceProviderEntity(
        id: "3",
        userId: "user3",
        name: "Provider 3",
        email: "provider3@example.com",
        phoneNumber: "1122334455",
        bio: "Professional and efficient",
        profileImage: "/path/to/provider3.jpg",
        location: "Location 3",
        skills: ["Skill 5", "Skill 6"],
      ),
    ];
  }
}
