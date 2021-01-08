import 'package:color_generator/cubit/color_cubit.dart';
import 'package:color_generator/screens/home/widgets/color_preview.dart';
import 'package:color_generator/screens/home/widgets/color_sliders.dart';
import 'package:color_generator/screens/home/widgets/hexadecimal_color_text_field.dart';
import 'package:color_generator/screens/home/widgets/toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode()); // Dartはnewを省略してもよい
      },
      child: Scaffold(
        body: Stack(
          children: [
            ColorPreview(),
            SafeArea(
              child: Align( // 子widgeの位置を揃える
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView( // 大きくなりすぎたら勝手にスクロールviewになってくれる
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocBuilder<ColorCubit, ColorState>( // blocの状態が変わったら再ビルドする.どのblocを見るかは、親widgetがcreatで渡してくれているはず
                          builder: (context, state) { // stateとしてColorStateが来るはず
                            return HexadecimalColorTextField(
                              key: Key("id1"),// widgetにつけるid的なもの。省力可。(その時はnullになる)
                              color: state.color,//state.color,
                              onChanged: (String hexadecimal) {
                                context
                                    .read<ColorCubit>()
                                    .updateHexadecimal(hexadecimal);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 60),
                        ColorSliders(),
                        const SizedBox(height: 15),
                        const Toolbar(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
