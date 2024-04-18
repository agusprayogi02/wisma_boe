part of 'view.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    //fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Center(child: Text('MAR', style: style));
      break;
    case 5:
      text = const Center(child: Text('JUN', style: style));
      break;
    case 8:
      text = const Center(child: Text('SEP', style: style));
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
