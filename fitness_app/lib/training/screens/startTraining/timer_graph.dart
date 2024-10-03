import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TimerGraph extends StatefulWidget {
  const TimerGraph({super.key});

  @override
  State<TimerGraph> createState() => _TimerGraphState();
}

class _TimerGraphState extends State<TimerGraph> {
  Timer? _timer;
  int _start = 0;
  bool isRunning = false;

  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _start++;
      });
    });
    isRunning = true;
  }

  void stopTimer() {
    _timer?.cancel();
    isRunning = false;
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      _start = 0;
      isRunning = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String getFormattedTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width - 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            getFormattedTime(_start),
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(
            width: 20,
            height: 10,
          ),
          Observer(
            builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  isRunning
                      ? ElevatedButton(
                          onPressed: stopTimer,
                          child: const Text(
                            'Stop',
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: startTimer,
                          child: const Text(
                            'Start',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: resetTimer,
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
