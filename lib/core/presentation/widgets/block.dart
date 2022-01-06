import 'package:test_project/core/presentation/presentation.dart';

class UBlock extends StatelessWidget {
  const UBlock({
    Key? key,
    required this.child,
    this.padding = DesignConstants.padding,
    this.borderRadius = DesignConstants.borderRadius,
    this.color = Colors.white,
  }) : super(key: key);

  final Color color;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
