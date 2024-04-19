part of 'home_report.dart';

class ReportBox extends StatefulWidget {
  const ReportBox({super.key, this.title, this.value});

  final String? title;
  final String? value;
  @override
  State<ReportBox> createState() => _ReportBoxState();
}

class _ReportBoxState extends State<ReportBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 160,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              offset: Offset(0, 1),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title ?? "Kamar Kotor",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.value ?? "0",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
