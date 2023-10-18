import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NeuButton extends StatefulWidget {
  final double? rad;
  final double? width;
  final double? height;
  final Color? textColor;
  final Color? bgColor;
  final EdgeInsets? padding;
  final Widget? child;
  final Alignment position;
  void Function()? onTap;

  NeuButton(
      {super.key,
      this.width,
      this.height,
      this.textColor,
      this.padding,
      this.child,
      this.onTap,
      required this.position,
      this.bgColor,
      this.rad});

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: widget.height,
          height: widget.height,
          padding: widget.padding,
          alignment: widget.position,
          decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(widget.rad ?? 50),
              boxShadow: isPressed
                  ? null
                  : [
                      const BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                          blurRadius: 12,
                          offset: Offset(-3, -3)),
                      const BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 12,
                          offset: Offset(3, 3))
                    ]),
          child: widget.child,
        ),
      ),
    );
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      isPressed = false;
    });
  }
}
