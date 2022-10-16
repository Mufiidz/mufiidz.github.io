import 'package:flutter/material.dart';

class MoveableWidget extends StatefulWidget {
  final Widget child;
  final double? top;
  final double? left;
  const MoveableWidget({
    Key? key,
    required this.child,
    this.top,
    this.left,
  }) : super(key: key);

  @override
  State<MoveableWidget> createState() => _MoveableWidgetState();
}

class _MoveableWidgetState extends State<MoveableWidget> {
  double xPosition = 0;
  double yPosition = 0;
  bool isDragged = false;

  @override
  void initState() {
    super.initState();
    yPosition = widget.top ?? yPosition;
    xPosition = widget.left ?? xPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: isDragged ? yPosition : widget.top,
      left: isDragged ? xPosition : widget.left,
      child: MouseRegion(
        cursor: SystemMouseCursors.move,
        child: GestureDetector(
          onPanUpdate: (onDrag) => setState(() {
            isDragged = true;
            xPosition += onDrag.delta.dx;
            yPosition += onDrag.delta.dy;
          }),
          child: widget.child,
        ),
      ),
    );
  }
}
