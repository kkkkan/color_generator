import 'package:color_generator/screens/home/widgets/color_slider.dart';
import 'package:color_generator/screens/home/widgets/alpha_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:color_generator/cubit/color_cubit.dart';

import 'dart:developer';

class ColorSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _color = context.watch<ColorCubit>().state.color;

    return SizedBox(
      width: 250,
      child: Row(
        children: [
          Expanded(
            child: ColorSlider(
              color: _color,
              colorName: 'Red',
              activeColor: Colors.red,
              value: _color.red,
              onChanged: (value) {
                context.read<ColorCubit>().updateRed(value);
              },
            ),
          ),
          Expanded(
            child: ColorSlider(
              color: _color,
              colorName: 'Green',
              activeColor: Colors.green,
              value: _color.green,
              onChanged: (value) {
                context.read<ColorCubit>().updateGreen(value);
              },
            ),
          ),
          Expanded(
            child: ColorSlider(
              color: _color,
              colorName: 'Blue',
              activeColor: Colors.blue,
              value: _color.blue,
              onChanged: (value) {
                context.read<ColorCubit>().updateBlue(value);
              },
            ),
          ),
          Expanded(
            child: AlphaSlider(
              color: _color,
              // colorName: 'Red',
              // activeColor: Colors.red,
              colorName: 'Alpha',
              value: _color.alpha,
              onChanged: (value) {
                context.read<ColorCubit>().updateAlpha(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
