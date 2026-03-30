import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tddController = TextEditingController();
  final _currentBGController = TextEditingController();
  final _targetBGController = TextEditingController();
  final _carbsController = TextEditingController();
  final _icrController = TextEditingController();
  final _isfController = TextEditingController();

  String _foundICR = "0.0";
  String _foundISF = "0.0";
  String _bolusResult = "0.0";
  final Color amberColor = const Color(0xFFFFC107);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _findValues() {
    double tdd = double.tryParse(_tddController.text) ?? 0;
    if (tdd > 0) {
      setState(() {
        _foundICR = (500 / tdd).toStringAsFixed(1);
        _foundISF = (1800 / tdd).toStringAsFixed(1);
      });
    }
  }

  void _calculateBolus() {
    if (_currentBGController.text.isEmpty ||
        _carbsController.text.isEmpty ||
        _icrController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill required values!'),
            backgroundColor: Colors.redAccent),
      );
      return;
    }
    double currentBG = double.tryParse(_currentBGController.text) ?? 0;
    double targetBG = double.tryParse(_targetBGController.text) ?? 100;
    double carbs = double.tryParse(_carbsController.text) ?? 0;
    double icr = double.tryParse(_icrController.text) ?? 1;
    double isf = double.tryParse(_isfController.text) ?? 1;

    double dose = (carbs / icr) + ((currentBG - targetBG) / isf);
    setState(() {
      _bolusResult = dose < 0 ? "0.0" : dose.toStringAsFixed(1);
    });
  }

  InputDecoration _inputStyle(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
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
      appBar: AppBar(
        title: const Text('Calculation Tools'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: amberColor,
          labelColor: amberColor,
          unselectedLabelColor: Colors.grey,
          tabs: const [Tab(text: "Find ICR/ISF"), Tab(text: "Calculate Bolus")],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            children: [
              const Text("Find your ideal values using TDD",
                  style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 20),
              TextField(
                  controller: _tddController,
                  decoration: _inputStyle('Total Daily Dose (Units)'),
                  keyboardType: TextInputType.number),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _findValues,
                style: ElevatedButton.styleFrom(
                  backgroundColor: amberColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('FIND VALUES',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 40),
              _resultCard("ICR Value", _foundICR, "g/U"),
              const SizedBox(height: 12),
              _resultCard("ISF Value", _foundISF, "mg/dL"),
            ],
          ),
          ListView(
            padding: const EdgeInsets.all(25),
            children: [
              const Center(
                  child: Text("Recommended Dose",
                      style: TextStyle(color: Colors.grey))),
              Center(
                  child: Text("$_bolusResult Units",
                      style: TextStyle(
                          color: amberColor,
                          fontSize: 48,
                          fontWeight: FontWeight.bold))),
              const SizedBox(height: 20),
              TextField(
                  controller: _currentBGController,
                  decoration: _inputStyle('Current Blood Sugar'),
                  keyboardType: TextInputType.number),
              TextField(
                  controller: _targetBGController,
                  decoration: _inputStyle('Target Blood Sugar'),
                  keyboardType: TextInputType.number),
              TextField(
                  controller: _carbsController,
                  decoration: _inputStyle('Carbohydrates (g)'),
                  keyboardType: TextInputType.number),
              TextField(
                  controller: _icrController,
                  decoration: _inputStyle('Manual ICR Value'),
                  keyboardType: TextInputType.number),
              TextField(
                  controller: _isfController,
                  decoration: _inputStyle('Manual ISF Value'),
                  keyboardType: TextInputType.number),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _calculateBolus,
                style: ElevatedButton.styleFrom(
                  backgroundColor: amberColor,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('CALCULATE',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _resultCard(String title, String value, String unit) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white70, fontSize: 15)),
          const Spacer(),
          Text(value,
              style: TextStyle(
                  color: amberColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Text(unit, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}