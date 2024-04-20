import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _dropdownValue;
  bool showForm = false;
  bool showCorporateForm = false;
  bool showIndividualForm = false;
  bool showDropdown = true;

  void dropdownCallback(String? selectedValue) {
    setState(() {
      _dropdownValue = selectedValue;
      if (_dropdownValue == 'individual') {
        showIndividualForm = true;
        showCorporateForm = false;
      } else if (_dropdownValue == 'corporate') {
        showIndividualForm = false;
        showCorporateForm = true;
      }
    });

    showDropdown = false;
    // if (selectedValue is String) {
    //   setState(() {
    //     _dropdownValue = selectedValue;
    //     showForm = true;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            if (showDropdown) _buildDropdown(),
            if (showIndividualForm) _individualForm(),
            if (showCorporateForm) _corporateForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          items: const [
            DropdownMenuItem<String>(
                child: Text("individual"), value: 'individual'),
            DropdownMenuItem<String>(
                child: Text("corporate"), value: 'corporate'),
          ],
          value: _dropdownValue,
          onChanged: dropdownCallback,
          isExpanded: true,
        )
      ],
    );
  }

  Widget _individualForm() {
    return Column(
      children: [
        // Individual form fields go here
        TextFormField(
          decoration: InputDecoration(labelText: 'Individual Field 1'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Individual Field 2'),
        ),
        // Add more form fields as needed
      ],
    );
  }

  Widget _corporateForm() {
    return Column(
      children: [
        // Individual form fields go here
        TextFormField(
          decoration: InputDecoration(labelText: 'Individual Field 1'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Individual Field 2'),
        ),
        // Add more form fields as needed
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Your form widgets go here
        Text('Form Placeholder'),
        // Example button to go back to dropdown
        ElevatedButton(
          onPressed: () {
            setState(() {
              showForm = false; // Set showForm to false to show dropdown again
            });
          },
          child: Text('Go Back'),
        ),
      ],
    );
  }
}
