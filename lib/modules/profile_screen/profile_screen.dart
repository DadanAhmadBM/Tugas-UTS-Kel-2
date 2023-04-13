import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});
  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    if (widget.user.name != "") {
      nameController.text = widget.user.name;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue[200],
                    ),
                    child: const Icon(
                      Icons.chevron_left_rounded,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search_rounded),
                        label: const Text("Nama"),
                        isDense: true,
                        hintText: "Nama Anda",
                        fillColor: Colors.blue[100],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Nama Wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Success"),
                  ),
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.blue),
              child: const Center(
                child: Text(
                  "Simpan",
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
