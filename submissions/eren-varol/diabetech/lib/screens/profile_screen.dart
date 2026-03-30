import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String _diabetesType = "Type-1";

  final Color amberColor = const Color(0xFFFFC107);

  void _saveProfile() {
    if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile saved for ${_nameController.text}!'),
        backgroundColor: amberColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  InputDecoration _inputStyle(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      hintStyle: const TextStyle(color: Colors.white30, fontSize: 14),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: amberColor.withValues(alpha: 0.5)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: amberColor, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: _nameController,
            style: const TextStyle(color: Colors.white),
            decoration: _inputStyle('Full Name', 'Enter your name and surname'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _ageController,
            style: const TextStyle(color: Colors.white),
            decoration: _inputStyle('Age', 'Enter your age'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 30),
          const Text(
            "Diabetes Category:",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    radioTheme: RadioThemeData(
                      fillColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.selected)) {
                          return amberColor;
                        }
                        return Colors.white70;
                      }),
                    ),
                  ),
                  child: RadioMenuButton<String>(
                    value: "Type-1",
                    groupValue: _diabetesType,
                    onChanged: (value) =>
                        setState(() => _diabetesType = value!),
                    child: const Text("Type-1"),
                  ),
                ),
              ),
              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    radioTheme: RadioThemeData(
                      fillColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.selected)) {
                          return amberColor;
                        }
                        return Colors.white70;
                      }),
                    ),
                  ),
                  child: RadioMenuButton<String>(
                    value: "Type-2",
                    groupValue: _diabetesType,
                    onChanged: (value) =>
                        setState(() => _diabetesType = value!),
                    child: const Text("Type-2"),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: _saveProfile,
            style: ElevatedButton.styleFrom(
              backgroundColor: amberColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 5,
            ),
            child: const Text(
              'SAVE PROFILE',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
