import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/Test.jpeg',
  'assets/images/Test.jpeg',
  'assets/images/Test.jpeg',
];

class GymCarousel extends StatefulWidget {
  const GymCarousel({super.key});

  @override
  State<GymCarousel> createState() => _GymCarouselState();
}

class _GymCarouselState extends State<GymCarousel>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  final double minScale = 1;
  final double maxScale = 4;
  double scale = 1;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )
      ..addListener(() => controller.value = animation!.value)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          removeOverlay();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CarouselSlider(
            items: imgList
                .map(
                  (item) => ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Center(
                      child: InteractiveViewer(
                        transformationController: controller,
                        clipBehavior: Clip.none,
                        panEnabled: false,
                        minScale: minScale,
                        maxScale: maxScale,
                        onInteractionStart: (details) {
                          if (details.pointerCount < 2) return;
                          showOverlay(context, item);
                        },
                        onInteractionEnd: (details) {
                          resetAnimation();
                        },
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: 400,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
          ),
        ],
      ),
    );
  }

  void showOverlay(BuildContext context, String item) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal((Offset.zero));
    final size = MediaQuery.of(context).size;

    entry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(color: Colors.black),
            ),
            Positioned(
              left: offset.dx,
              top: offset.dy,
              width: size.width,
              child: buildImage(item),
            ),
          ],
        );
      },
    );
    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  Widget buildImage(String item) {
    return InteractiveViewer(
      transformationController: controller,
      clipBehavior: Clip.none,
      panEnabled: false,
      minScale: minScale,
      maxScale: maxScale,
      onInteractionStart: (details) {
        if (details.pointerCount < 2) return;

        showOverlay(context, item);
      },
      onInteractionUpdate: (details) {
        if (entry == null) return;

        scale = details.scale;
        entry!.markNeedsBuild();
      },
      onInteractionEnd: (details) {
        resetAnimation();
      },
      child: Image.asset(
        item,
        fit: BoxFit.cover,
        width: 400,
      ),
    );
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));

    animationController.forward(from: 0);
  }
}
