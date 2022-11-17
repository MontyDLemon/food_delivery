import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final FocusNode _focusNode = FocusNode();
  bool _isOpen = false;
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)?.insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
  }

//TODO: funziona solo quando faccio pop, se faccio push rimane aperto :D
  @override
  void dispose() {
    _overlayEntry.remove();
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox;
    Size? size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
        builder: (context) => Positioned(
              left: offset.dx,
              top: offset.dy + size.height,
              width: size.width + 10.0,
              child: Material(
                elevation: 4.0,
                child: Column(
                  children: const <Widget>[
                    ListTile(
                      title: Text('Vegetarian'),
                    ),
                    ListTile(
                      title: Text('Vegan'),
                    ),
                    ListTile(
                      title: Text('Meat'),
                    )
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    //quando esco dalla pagina chiuderlo per carità :P
    return GestureDetector(
      onTap: () {
        if (_isOpen) {
          _overlayEntry.remove();
          setState(() {
            _isOpen = false;
          });
        } else {
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context)?.insert(_overlayEntry);
          setState(() {
            _isOpen = true;
          });
        }
      },
      child: Card(
        elevation: 10.0,
        margin: const EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              "Category",
              style: TextStyle(fontSize: 18.0),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
