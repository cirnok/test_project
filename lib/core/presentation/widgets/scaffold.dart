import 'package:test_project/core/presentation/presentation.dart';

class UScaffold extends StatelessWidget {
  const UScaffold({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.white,
    required this.body,
    this.heroTag,
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final Widget body;
  // ignore: no-object-declaration
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: Visibility(
          visible: context.router.canPopSelfOrChildren,
          child: IconButton(
            icon: const Icon(FeatherIcons.arrowLeftCircle),
            onPressed: () => context.popRoute(),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: heroTag != null
              ? Hero(
                  tag: heroTag!,
                  flightShuttleBuilder: customFlightShuttleBuilder,
                  child: UBlock(
                    color: backgroundColor,
                    padding: EdgeInsets.zero,
                    borderRadius: DesignConstants.borderRadiusOnlyTop,
                    child: body,
                  ),
                )
              : UBlock(
                  color: backgroundColor,
                  padding: EdgeInsets.zero,
                  borderRadius: DesignConstants.borderRadiusOnlyTop,
                  child: body,
                ),
        ),
      ),
    );
  }

  // ignore: long-parameter-list
  Widget customFlightShuttleBuilder(
    _,
    animation,
    flightDirection,
    fromHeroContext,
    toHeroContext,
  ) {
    {
      final fromHero = fromHeroContext.widget as Hero;
      final toHero = toHeroContext.widget as Hero;

      return UBlock(
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            FadeTransition(
              opacity: animation.drive(
                Tween<double>(begin: 0.0, end: 1.0).chain(
                  CurveTween(
                    curve: const Interval(
                      0.9,
                      1,
                    ),
                  ),
                ),
              ),
              // ignore: avoid-nested-conditional-expressions
              child: flightDirection == HeroFlightDirection.push
                  ? toHero.child
                  : fromHero.child,
            ),
            FadeTransition(
              opacity: animation.drive(
                Tween<double>(begin: 1.0, end: 0.0).chain(
                  CurveTween(
                    curve: const Interval(
                      0,
                      0.1,
                    ),
                  ),
                ),
              ),
              // ignore: avoid-nested-conditional-expressions
              child: flightDirection != HeroFlightDirection.push
                  ? toHero.child
                  : fromHero.child,
            ),
          ],
        ),
      );
    }
  }
}
