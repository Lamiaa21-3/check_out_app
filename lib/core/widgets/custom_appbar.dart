


import 'package:flutter/material.dart';

import '../utils/styles.dart';

AppBar buildAppBar({ String ? title , required BuildContext  context}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    leading: IconButton(

      icon: Icon(Icons.arrow_back,size: 40,), onPressed: () { Navigator.pop(context); },
    ),

    title: Text(title?? '',style: Styles.style25 ,),
  );
}