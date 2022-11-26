import 'package:collection/collection.dart';
import 'package:dexcom_board/providers/glucose_range_provider.dart';
import 'package:dexcom_share_api/dexcom_models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const maxY = 22;

extension MoodChartFilterExt on Iterable<GlucoseEventRecord>? {
  Map<DateTime, GlucoseEventRecord?> filterByDateRange(GlucoseRangeFilter rangeFilter) {
    final allValuesMap = this == null
        ? <DateTime, GlucoseEventRecord?>{}
        : <DateTime, GlucoseEventRecord?>{
            for (final event in this!)
              if (event.WT != null && event.glucoseValueEu != null)
                DateTime(
                  event.WT!.year,
                  event.WT!.month,
                  event.WT!.day,
                  event.WT!.hour,
                  event.WT!.minute,
                ): event,
          };

    final now = DateTime.now();
    final start = DateTime(
        now.year, now.month, now.day, now.hour, now.minute - rangeFilter.getShiftInMinutes());
    final end = DateTime(now.year, now.month, now.day, now.hour, now.minute);

    final dateRangeValues = List.generate(
      end.difference(start).inMinutes + 1,
      (i) => start.add(Duration(minutes: i)),
    );

    final filteredMap = <DateTime, GlucoseEventRecord?>{};
    for (final date in dateRangeValues) {
      final dayEvent = allValuesMap[date];
      filteredMap[date] = dayEvent;
    }

    return filteredMap;
  }
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    super.key,
    required this.data,
    this.dotSize = 2.8,
  });

  final List<GlucoseEventRecord>? data;

  final double dotSize;

  static const List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    final currFilter = context.watch<GlucoseRangeProvider>().currFilter;
    final Map<DateTime, GlucoseEventRecord?> filteredData = data.filterByDateRange(currFilter);

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: AspectRatio(
        aspectRatio: 1.70,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            color: Theme.of(context).primaryColor.withOpacity(0.05),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(context, filteredData),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
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

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(BuildContext context, Map<DateTime, GlucoseEventRecord?> filteredData) {
    return LineChartData(
      borderData: FlBorderData(show: false),
      minX: 0,
      minY: 0,
      maxY: maxY.toDouble(),
      maxX: filteredData.length - 1,
      lineBarsData: [
        LineChartBarData(
          spots: filteredData.entries
              .mapIndexed((i, e) {
                final event = e.value;
                return event == null ? null : FlSpot(i.toDouble(), e.value!.glucoseValueEu!);
              })
              .whereType<FlSpot>()
              .toList(),
          isCurved: false,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
              radius: dotSize,
              color: Theme.of(context).primaryColor,
              strokeColor: Theme.of(context).primaryColor,
            ),
          ),
          color: Theme.of(context).primaryColor,
        ),
      ],
      extraLinesData: ExtraLinesData(
        extraLinesOnTop: false,
        horizontalLines: List.generate(maxY + 1, (index) => index)
            .mapIndexed(
              (i, _) => HorizontalLine(
                y: i % 2 == 0 ? i.toDouble() : 0,
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                strokeWidth: 1,
              ),
            )
            .toList(),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: false,
        verticalInterval: 1,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          drawBehindEverything: true,
          sideTitles: SideTitles(
            interval: 2,
            showTitles: true,
            reservedSize: 40,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      lineTouchData: LineTouchData(
        getTouchLineEnd: (_, __) => double.infinity,
        getTouchedSpotIndicator: (_, spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
              FlLine(color: Theme.of(context).primaryColor, strokeWidth: 3),
              FlDotData(
                getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
                  radius: dotSize,
                  color: Theme.of(context).primaryColor,
                  strokeWidth: 0,
                ),
              ),
            );
          }).toList();
        },
      ),
    );
  }
}
