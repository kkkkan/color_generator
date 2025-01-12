import 'package:color_generator/screens/home/widgets/color_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSlider extends StatefulWidget {
  final String colorName;
  final Color color; // 背景色の輝度から文字色を決めるためだけに使っている
  final int value;
  final Color activeColor;// スライダーが選ばれている時の色
  final Function(int value) onChanged;

  const ColorSlider({
    Key key,
    this.color,
    this.colorName,
    this.value,
    this.activeColor,
    this.onChanged,
  }) : super(key: key);

  @override
  _ColorSliderState createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<int> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

    _setupAnimation(0, widget.value);
  }

  _setupAnimation(int from, int to) {
    _animation = IntTween(begin: from, end: to).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward(from: 0);
  }

  @override
  void didUpdateWidget(covariant ColorSlider oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _setupAnimation(oldWidget.value, widget.value);
    }
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black.withOpacity(.075),
          ),
          child: Text(
            widget.colorName[0], // 一文字目。配列という意味ではない。
            style: TextStyle(
              color: contrastColor.withOpacity(.4),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ColorTextField(
          color: widget.color,
          value: _animation.value.toString(),
          onChanged: (value) => widget.onChanged(int.parse(value)),
        ),
        SizedBox(height: 15),
        RotatedBox(
          quarterTurns: 3,
          child: CupertinoSlider(
            min: 0,
            max: 255,
            thumbColor: widget.activeColor,
            activeColor: widget.activeColor.withOpacity(.5),
            value: _animation.value.toDouble(),
            onChanged: (value) => widget.onChanged(value.toInt()),
          ),
        ),
      ],
    );
  }

  Color get contrastColor =>//Colors.black;
      widget.color.computeLuminance() > .5 ? Colors.black : Colors.white;
}
