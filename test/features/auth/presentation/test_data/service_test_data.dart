import 'package:skillseek/features/servicesavailable/domain/entity/serviceavailable_entity.dart';

class ServiceTestData {
  ServiceTestData._();

  static List<ServiceEntity> getServiceTestData() {
    return [
      ServiceEntity(
        id: "1",
        userId: "user1",
        title: "Service 1",
        description: "Description for Service 1",
        skills: const ["Skill 1", "Skill 2"],
        image: "/path/to/service1.jpg",
        createdAt: DateTime(2022, 1, 1),
      ),
      ServiceEntity(
        id: "2",
        userId: "user2",
        title: "Service 2",
        description: "Description for Service 2",
        skills: const ["Skill 3", "Skill 4"],
        image: "/path/to/service2.jpg",
        createdAt: DateTime(2022, 2, 1),
      ),
      ServiceEntity(
        id: "3",
        userId: "user3",
        title: "Service 3",
        description: "Description for Service 3",
        skills: const ["Skill 5", "Skill 6"],
        image: "/path/to/service3.jpg",
        createdAt: DateTime(2022, 3, 1),
      ),
    ];
  }
}
