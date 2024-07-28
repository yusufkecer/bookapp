import 'package:bookapp/product/string_data/string.dart';
import 'package:bookapp/product/widgets/buttons/confirm_button.dart';
import 'package:flutter/material.dart';

class OpenableListiView extends StatefulWidget {
  final Widget child;
  final int duration;
  final double height;
  final String hideText;
  final String showText;
  const OpenableListiView(
      {super.key,
      required this.child,
      this.duration = 200,
      this.height = 250,
      this.hideText = "Gizle",
      this.showText = "Gör"});

  @override
  State<OpenableListiView> createState() => _OpenableListiViewState();
}

class _OpenableListiViewState extends State<OpenableListiView> with SingleTickerProviderStateMixin {
  AnimationController? animatedcontroller;

  ValueNotifier<bool> isExpanded = ValueNotifier(false);

  @override
  void initState() {
    animatedcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConfirmButton(
              onPressed: () {
                if (animatedcontroller == null) {
                  throw Exception("animatedcontroller is null");
                }
                isExpanded.value = !isExpanded.value;
                if (isExpanded.value) {
                  animatedcontroller!.forward();
                } else {
                  animatedcontroller!.reverse();
                }
              },
              text: ValueListenableBuilder(
                valueListenable: isExpanded,
                builder: (context, value, child) => Text(value ? StringData.hideBooks : StringData.showBooks,
                ),
              ),
            ),
          ],
        ),
        SizeTransition(
          sizeFactor: animatedcontroller!,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: widget.height,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
