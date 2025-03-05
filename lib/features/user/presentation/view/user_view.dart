import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/features/user/domain/entity/user_entity.dart';
import 'package:skillseek/features/user/presentation/view_more/user_bloc.dart';
import 'package:skillseek/features/user/presentation/view_more/user_event.dart';
import 'package:skillseek/features/user/presentation/view_more/user_state.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  CustomerEntity? selectedCustomer;
  bool isEditing = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CustomerBloc>(context).add(FetchCustomersEvent());
  }

  void _showProfile(CustomerEntity customer) {
    setState(() {
      selectedCustomer = customer;
      isEditing = false;
    });
  }

  void _startEditing() {
    setState(() {
      isEditing = true;
      _nameController.text = selectedCustomer?.name ?? '';
      _locationController.text = selectedCustomer?.location ?? '';
    });
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<CustomerBloc>(context).add(
        UpdateCustomerProfileEvent(
          id: selectedCustomer!.id,
          name: _nameController.text,
          location: _locationController.text,
        ),
      );

      // ✅ Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("✅ Update Successful"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      setState(() {
        isEditing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ White Background
      appBar: AppBar(
        title: const Text('Customers'),
        backgroundColor: const Color(0xFF1F4A9B), // ✅ Blue AppBar
      ),
      body: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
            // } else if (state.errorMessage.isNotEmpty) {
            //   return Center(child: Text("❌ ${state.errorMessage}"));
          } else if (state.customers.isEmpty) {
            return const Center(child: Text("No customers found."));
          }

          if (selectedCustomer == null) {
            return _buildCustomerList(state.customers);
          } else if (isEditing) {
            return _buildEditForm();
          } else {
            return _buildProfileView();
          }
        },
      ),
    );
  }

  /// ✅ Customer List View
  Widget _buildCustomerList(List<CustomerEntity> customers) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        final customer = customers[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          elevation: 4,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: const AssetImage(
                  "assets/images/person.png"), // ✅ Always use the dummy image
              backgroundColor: Colors.grey[200],
            ),
            title: Text(
              customer.name.isNotEmpty ? customer.name : "No Name",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(customer.location.isNotEmpty
                ? customer.location
                : "No Location"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => _showProfile(customer),
          ),
        );
      },
    );
  }

  /// ✅ Customer Profile View (Always Uses Dummy Image)
  Widget _buildProfileView() {
    final customer = selectedCustomer!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: const AssetImage(
                "assets/images/person.png"), // ✅ Always use the dummy image
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          _buildInfoRow("Name", customer.name),
          _buildInfoRow("Location", customer.location),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1F4A9B), // ✅ Blue Button
              foregroundColor: Colors.white, // ✅ White Text
            ),
            icon: const Icon(Icons.edit),
            label: const Text("Edit Profile"),
            onPressed: _startEditing,
          ),
          TextButton(
            child: const Text("Back"),
            onPressed: () => setState(() => selectedCustomer = null),
          ),
        ],
      ),
    );
  }

  /// ✅ Edit Customer Form
  Widget _buildEditForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              validator: (value) =>
                  value!.isEmpty ? "Name can't be empty" : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              validator: (value) =>
                  value!.isEmpty ? "Location can't be empty" : null,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F4A9B), // ✅ Blue Button
                    foregroundColor: Colors.white, // ✅ White Text
                  ),
                  child: const Text("Save"),
                ),
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => setState(() => isEditing = false),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Info Row Widget
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value.isNotEmpty ? value : "Not Available")),
        ],
      ),
    );
  }
}
