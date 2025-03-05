import 'package:skillseek/features/user/domain/entity/user_entity.dart';

class CustomerTestData {
  CustomerTestData._();

  static List<CustomerEntity> getCustomerTestData() {
    return [
      CustomerEntity(
        id: "1",
        userId: "user1",
        name: "Customer 1",
        email: "customer1@example.com",
        location: "Location 1",
        phoneNumber: "1234567890",
        profileImage: "http://localhost:3000/profile1.jpg",
        createdAt: DateTime(2022, 1, 1),
      ),
      CustomerEntity(
        id: "2",
        userId: "user2",
        name: "Customer 2",
        email: "customer2@example.com",
        location: "Location 2",
        phoneNumber: "0987654321",
        profileImage: "http://localhost:3000/profile2.jpg",
        createdAt: DateTime(2022, 2, 1),
      ),
      CustomerEntity(
        id: "3",
        userId: "user3",
        name: "Customer 3",
        email: "customer3@example.com",
        location: "Location 3",
        phoneNumber: "1122334455",
        profileImage: "http://localhost:3000/profile3.jpg",
        createdAt: DateTime(2022, 3, 1),
      ),
    ];
  }
}
