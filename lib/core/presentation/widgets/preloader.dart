import 'package:flutter/cupertino.dart';
import 'package:test_project/core/domain/domain.dart';

class UPreloader extends StatelessWidget {
  const UPreloader({
    Key? key,
    this.failure,
  }) : super(key: key);

  final Failure? failure;

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator();
  }
}
