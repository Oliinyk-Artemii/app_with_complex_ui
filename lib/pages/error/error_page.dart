import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final FlutterErrorDetails details;
  final bool showStacktrace;

  const ErrorPage({
    Key? key,
    required this.details,
    required this.showStacktrace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = 'error_screen_title'.tr();

    String description = 'error_screen_text'.tr();
    if (showStacktrace) {
      description += ' ${'error_details_below'.tr()}';
    }

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.announcement,
                color: Colors.red,
                size: 40,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                description,
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              if (showStacktrace) _stackTraceWidget
            ],
          ),
        ),
      ),
    );
  }

  Widget get _stackTraceWidget {
    final List<String> stackTrace = details.stack.toString().split('\n');
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: stackTrace.length,
        itemBuilder: (BuildContext context, int index) {
          final String? line = stackTrace[index];
          if (line != null && line.isNotEmpty == true) {
            return Text(line);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
