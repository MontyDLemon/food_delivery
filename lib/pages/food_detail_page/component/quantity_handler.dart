import 'package:flutter/material.dart';

import '../../../theme.dart';
import 'rounded_container.dart';

//riga -> pulsante -, pulsante + e Numero che rappresenta la quantità
class QuantityHandler extends StatefulWidget {
  final Function(int) onBtnTapped;
  const QuantityHandler({
    Key? key,
    required this.onBtnTapped,
  }) : super(key: key);

  @override
  State<QuantityHandler> createState() => _QuantityHandlerState();
}

class _QuantityHandlerState extends State<QuantityHandler> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, cons) {
        return Row(
          children: [
            RoundedContainer(
              width: cons.maxWidth * 0.25,
              height: cons.maxWidth * 0.25,
              color: AppColor.transparentColor,
              child: GestureDetector(
                  onTap: quantity <= 0
                      ? null
                      : () {
                          quantity--;
                          widget.onBtnTapped(quantity);
                          setState(() {});
                        },
                  child: const FittedBox(
                    child: Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "$quantity",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            RoundedContainer(
              width: cons.maxWidth * 0.25,
              height: cons.maxWidth * 0.25,
              color: AppColor.primaryColor,
              child: GestureDetector(
                onTap: () => setState(() {
                  quantity++;
                  widget.onBtnTapped(quantity);
                }),
                child: const FittedBox(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      });
}
