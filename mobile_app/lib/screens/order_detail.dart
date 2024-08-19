import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderDetailScreen(),
    );
  }
}

class OrderDetailScreen extends StatefulWidget {
  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  String? selectedDate;
  String? selectedStartTime;
  String? selectedEndTime;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Order detail', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            _buildDatePicker(),
            SizedBox(height: 16),
            _buildTimePicker(),
            SizedBox(height: 16),
            _buildSummaryCard(),
            Spacer(),
            _buildPayButton(),
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
          prefixIcon: Icon(Icons.calendar_today, color: Colors.black),
          labelText: 'Select a date',
          labelStyle: TextStyle(color: Colors.black),
          filled: true,
          fillColor: Color(0xFFE9F0F7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
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

  Widget _buildDropdown(
      String hint, IconData icon, String? value, List<String> items) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black),
        labelText: hint,
        labelStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Color(0xFFE9F0F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
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
          if (hint == 'Start with') selectedStartTime = newValue;
          if (hint == 'End with') selectedEndTime = newValue;
        });
      },
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFE9F0F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('VEHICLE', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 8),
          Text('2021 Audi Q3 • B 1234 CN',
              style: TextStyle(color: Colors.black, fontSize: 16)),
          SizedBox(height: 16),
          Text('PARKING LOT', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 8),
          Text('Universitas Indonesia',
              style: TextStyle(color: Colors.black, fontSize: 16)),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 20,
                    color: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Text('TOTAL', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Text('IDR 12000',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPayButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text('Pay & End Park'),
      ),
    );
  }
}
