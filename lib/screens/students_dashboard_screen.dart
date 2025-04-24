import 'package:flutter/material.dart';

class StudentsDashboardScreen extends StatelessWidget {
  const StudentsDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF21C08B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        title: const Text(
          'الطلاب',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _DashboardTile(
                    color: Colors.cyanAccent.shade100,
                    icon: Icons.description,
                    label: 'التقارير',
                    onTap: () {},
                  ),
                  _DashboardTile(
                    color: Colors.indigo.shade200,
                    icon: Icons.assignment,
                    label: 'الواجبات',
                    onTap: () {},
                  ),
                  _DashboardTile(
                    color: Colors.orange.shade200,
                    icon: Icons.mail_outline,
                    label: 'الرسائل',
                    onTap: () {},
                  ),
                  _DashboardTile(
                    color: Colors.lightGreen.shade200,
                    icon: Icons.calendar_today,
                    label: 'الجداول الدراسية',
                    onTap: () {},
                  ),
                  _DashboardTile(
                    color: Colors.purpleAccent.shade100,
                    icon: Icons.bar_chart,
                    label: 'نتائج الاختبارات',
                    onTap: () {},
                  ),
                  _DashboardTile(
                    color: Colors.blueAccent.shade100,
                    icon: Icons.menu_book,
                    label: 'الملخصات', // بدل الاستئذانات
                    onTap: () {},
                  ),
                  _DashboardTile(
                    color: Colors.green.shade300,
                    icon: Icons.check_circle_outline,
                    label: 'الحضور والغياب', // بدل تتبع الباص
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardTile extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _DashboardTile({
    required this.color,
    required this.icon,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Icon(icon, color: Colors.white, size: 36),
            ),
            const SizedBox(height: 14),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF444444),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
