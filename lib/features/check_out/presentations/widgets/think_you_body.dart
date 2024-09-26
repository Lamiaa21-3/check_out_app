import 'package:check_out_app/features/check_out/presentations/widgets/main_ietm_card.dart';
import 'package:check_out_app/features/check_out/presentations/widgets/payment_ietm_info.dart';
import 'package:check_out_app/features/check_out/presentations/widgets/total_price_ietm.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/styles.dart';
import 'card_info_widget.dart';

class ThinkYouBody extends StatelessWidget {
  const ThinkYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          MainIetmCard(),
          Positioned(
            bottom: MediaQuery
                .sizeOf(context)
                .height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: Row(
              children:
              List.generate(
                50,
                    (index) =>
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          color: const Color(0xffB8B8B8),
                          height: 2,
                        ),
                      ),
                    ),
              ),

            ),
          ),
          Positioned(
            bottom: MediaQuery
                .of(context)
                .size
                .height * .2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery
                .of(context)
                .size
                .height * .2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
              top: -50,
              left: 0,
              right: 0,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xffD9D9D9),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check, size: 60, color: Colors.white ,),
                ),
              ))
        ],
      ),
    );
  }
}
