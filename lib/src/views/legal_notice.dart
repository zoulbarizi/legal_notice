import 'package:flutter/material.dart';

import '../utils/consts.dart';

class LegalNotice extends StatefulWidget {
  const LegalNotice({super.key});

  @override
  LegalNoticeState createState() => LegalNoticeState();
}

class LegalNoticeState extends State<LegalNotice> {
  final ScrollController scrollCtrl = ScrollController();
  var reachEnd = false, dark = false;
  double fontSize = 14.0;

  listener() {
    final maxScroll = scrollCtrl.position.maxScrollExtent;
    // final minScroll = scrollCtrl.position.minScrollExtent;
    if (scrollCtrl.offset >= maxScroll) {
      setState(() => reachEnd = true);
    }

    if (scrollCtrl.offset < maxScroll) {
      setState(() => reachEnd = false);
    }
  }

  @override
  void initState() {
    scrollCtrl.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    scrollCtrl.removeListener(listener);
    scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "privacy policies".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: dark ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: dark ? Colors.black : Colors.white,
        actions: [
          IconButton(
            onPressed: () => setState(() => dark = !dark),
            icon:
                Icon(dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: dark ? Colors.black : Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              offset: Offset(-1.0, -1.0),
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Scrollbar(
          // isAlwaysShown: true,
          child: ListView(
            controller: scrollCtrl,
            padding: const EdgeInsets.all(10.0),
            children: [
              Text(
                Consts.policies,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: fontSize,
                  color: dark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: reachEnd ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Consts.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "I AGREE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Consts.mainColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.zoom_out),
              ),
              onTap: () => setState(() => fontSize--),
            ),
            const SizedBox(width: 10),
            InkWell(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Consts.mainColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.zoom_in),
              ),
              onTap: () => setState(() => fontSize++),
            ),
          ],
        ),
      ),
    );
  }
}
