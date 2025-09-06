import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> contactData = [
      {'name': 'สมชาย ใจดี', 'phone': '081-123-4567', 'icon': Icons.person},
      {'name': 'สมหญิง รักงาน', 'phone': '082-987-6543', 'icon': Icons.build},
      {'name': 'วิชัย มีสุข', 'phone': '083-555-1111', 'icon': Icons.movie},
      // ... รายชื่อผู้ติดต่อเพิ่มเติม
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ปฏิบัติการบทที่ 5 - Layouts'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: contactData.length,
          itemBuilder: (BuildContext context, int index) {
            final contact = contactData[index];
            // ฟังก์ชันนี้ถูกเรียกสำหรับแต่ละรายการที่มองเห็น
            // 'index' คือตำแหน่งของรายการปัจจุบัน (0, 1, 2, ...)
            return ListTile(
              leading: Icon(contact['icon'] as IconData, color: Colors.blue),
              title: Text(contact['name'] as String),
              subtitle: Text(contact['phone'] as String),
              trailing: IconButton(
                icon: const Icon(Icons.message),
                onPressed: () {
                  print('ส่งข้อความถึง ${contact['name']}...');
                },
              ),
              onTap: () {
                print('แตะที่ ${contact['name']}');
              },
            );
          },
        ),
      ),
    );
  }
}
