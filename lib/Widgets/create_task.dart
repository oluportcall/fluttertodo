import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/Widgets/home.dart';
import 'package:file_picker/file_picker.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  AddTaskScreenState createState() => AddTaskScreenState();
}

class AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController dateTodoController = TextEditingController();
  final TextEditingController timeTodoController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  PlatformFile? pickedFile;

  @override
  void initState() {
    super.initState();
    dateTodoController.text = ""; // Set initial value of date text field
    timeTodoController.text = ""; // Set initial value of time text field
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dateTodoController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        timeTodoController.text = pickedTime.format(context);
      });
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        pickedFile = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: subtitleController,
              decoration: const InputDecoration(
                labelText: 'Subtitle',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: dateTodoController,
              decoration: const InputDecoration(
                labelText: 'Date Todo',
                border: OutlineInputBorder(),
              ),
              onTap: () => _pickDate(context),
              readOnly: true, // Prevents keyboard from appearing
            ),
            const SizedBox(height: 8),
            TextField(
              controller: timeTodoController,
              decoration: const InputDecoration(
                labelText: 'Time Todo',
                border: OutlineInputBorder(),
              ),
              onTap: () => _pickTime(context),
              readOnly: true, // Prevents keyboard from appearing
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle add task
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text('Add Task'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const Home()),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text(pickedFile == null
                  ? 'Pick File'
                  : 'File: ${pickedFile!.name}'),
            ),
            // // Other buttons...
          ],
        ),
      ),
    );
  }
}
