import 'package:test_project/core/presentation/presentation.dart';

class UScaffold extends StatelessWidget {
  const UScaffold({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.floatingActionButton,
    required this.body,
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final Widget? floatingActionButton;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      appBar: AppBar(
        leading: Visibility(
          visible: context.router.canPopSelfOrChildren,
          child: IconButton(
            icon: const Icon(FeatherIcons.arrowLeftCircle),
            onPressed: () => context.popRoute(),
          ),
        ),
        title: Text(title),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.black,
          child: UCard(
            color: backgroundColor,
            padding: EdgeInsets.zero,
            borderRadius: DesignConstants.borderRadiusOnlyTop,
            child: body,
          ),
        ),
      ),
    );
  }
}
