import 'package:flutter/material.dart';

void main() {
  runApp(const WaterUsageApp());
}

// Root widget of the application
class WaterUsageApp extends StatelessWidget {
  const WaterUsageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Water Usage Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const WaterCounterPage(),
    );
  }
}

// StatefulWidget because the water counter changes
class WaterCounterPage extends StatefulWidget {
  const WaterCounterPage({super.key});

  @override
  State<WaterCounterPage> createState() => _WaterCounterPageState();
}

class _WaterCounterPageState extends State<WaterCounterPage> {
  // Stores the number of glasses
  int glassCount = 0;

  // One glass is approximately 250 ml
  final double glassSize = 0.25;

  // Function to add one glass
  void addGlass() {
    setState(() {
      glassCount++;
    });
  }

  // Function to reset the counter
  void resetCounter() {
    setState(() {
      glassCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate total water consumed
    double totalLiters = glassCount * glassSize;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Water Usage Counter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Water icon
              const Icon(
                Icons.water_drop,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              // Heading
              const Text(
                'Today\'s Water Usage',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Glass counter
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Glasses Consumed',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$glassCount',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${totalLiters.toStringAsFixed(2)} Liters',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Add Glass button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: addGlass,
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'Add Glass',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Reset button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: resetCounter,
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'Reset',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // SDG message
              const Text(
                'Every drop counts! 💧',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'SDG 6: Clean Water and Sanitation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
