// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Wallpaper extends StatelessWidget {
	const Wallpaper({super.key});

	@override
	Widget build(BuildContext context) {

		return Container(

			decoration: BoxDecoration(

				image: DecorationImage(

					image: AssetImage('lib/Imagens/PDM_fundo2oretorno.png'),
					fit: BoxFit.cover)),
				
		);
	}
}