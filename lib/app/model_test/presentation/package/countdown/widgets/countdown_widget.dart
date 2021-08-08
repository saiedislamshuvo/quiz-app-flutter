  
import 'dart:async';

import 'package:flutter/material.dart';
import '../utils/countdown_utils.dart';

class Countdown extends StatefulWidget {
  const Countdown({
    Key? key,
    required this.duration,
    required this.builder,
    this.interval = const Duration(seconds: 1),
  }) : super(key: key);

  final Duration duration;
  final Duration interval;
  final Widget Function(BuildContext context, Duration remaining, int second) builder;
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  Timer? _timer;
  Duration? _duration;
  @override
  void initState() {
    _duration = widget.duration;
    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(widget.interval, timerCallback);
  }

  void timerCallback(Timer timer) {
    setState(() {
      if (_duration?.inSeconds == 0) {
        timer.cancel();
      } else {
        _duration = Duration(seconds: _duration!.inSeconds + 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _duration??Duration(seconds: 0), _duration!.inSeconds + 1);
  }
}

class CountdownFormatted extends StatelessWidget {
  const CountdownFormatted({
    Key? key,
    required this.duration,
    required this.builder,
    this.interval = const Duration(seconds: 1),
    this.formatter,
  }) : super(key: key);

  final Duration duration;
  final Duration interval;

  /// An function to format the remaining time
  final String Function(Duration)? formatter;

  final Widget Function(BuildContext context, String remaining, int inSecond) builder;

  Function(Duration) _formatter() {
    if (formatter != null) return formatter!;
    if (duration.inHours >= 1) return formatByHours;
    if (duration.inMinutes >= 1) return formatByMinutes;

    return formatByMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Countdown(
      interval: interval,
      duration: duration,
      builder: (BuildContext ctx, Duration remaining, int inSecond) {
        return builder(ctx, _formatter()(remaining), inSecond);
      },
    );
  }
}