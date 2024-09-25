


import 'package:flutter/material.dart';

import '../utils/styles.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    leading: IconButton(

      icon: Icon(Icons.arrow_back), onPressed: () {  },
    ),

    title: Text(title,style: Styles.style25 ,),
  );
}