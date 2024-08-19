import 'package:flutter/material.dart';
import 'package:mobile_app/screens/order_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookingFormScreen(),
    );
  }
}

class BookingFormScreen extends StatefulWidget {
  @override
  _BookingFormScreenState createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  String? selectedDate;
  String? selectedStartTime;
  String? selectedEndTime;
  String? selectedLocation;
  String? selectedVehicle;
  String? selectedPaymentMethod;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF45C47C)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Booking Form'),
        backgroundColor: Color(0xFFEDF2F4),
        elevation: 1,
        leadingWidth: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 41,
            ),
            _buildDatePicker(),
            SizedBox(height: 16),
            _buildTimePicker(),
            SizedBox(height: 16),
            _buildDropdown("Select Location", Icons.location_on,
                selectedLocation, ['Location 1', 'Location 2']),
            SizedBox(height: 16),
            _buildDropdown("Select Vehicle", Icons.directions_car,
                selectedVehicle, ['Car', 'Motorcycle']),
            SizedBox(height: 16),
            _buildDropdown("Payment Method", Icons.payment,
                selectedPaymentMethod, ['Credit Card', 'Cash']),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF45C47C),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Park Now',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.calendar_today),
          labelText: 'Select a date',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          selectedDate ?? 'Select a date',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildTimePicker() {
    List<String> timeOptions = _generateTimeOptions();

    return Row(
      children: [
        Expanded(
          child: _buildDropdown(
            "Start with",
            Icons.access_time,
            selectedStartTime,
            timeOptions,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _buildDropdown(
            "End with",
            Icons.access_time,
            selectedEndTime,
            timeOptions,
          ),
        ),
      ],
    );
  }

  List<String> _generateTimeOptions() {
    List<String> timeOptions = [];
    for (int hour = 0; hour < 24; hour++) {
      for (int minute = 0; minute < 60; minute += 30) {
        String hourStr = hour.toString().padLeft(2, '0');
        String minuteStr = minute.toString().padLeft(2, '0');
        timeOptions.add("$hourStr:$minuteStr");
      }
    }
    return timeOptions;
  }

  Widget _buildDropdown(
      String hint, IconData icon, String? value, List<String> items) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          if (hint == 'Select Location') selectedLocation = newValue;
          if (hint == 'Select Vehicle') selectedVehicle = newValue;
          if (hint == 'Payment Method') selectedPaymentMethod = newValue;
          if (hint == 'Start with') selectedStartTime = newValue;
          if (hint == 'End with') selectedEndTime = newValue;
        });
      },
    );
  }
}
