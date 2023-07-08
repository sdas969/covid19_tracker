import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_grid/responsive_grid.dart';

class PreventionContent extends StatelessWidget {
  const PreventionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Column(children: [
        ResponsiveBuilder(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('COVID-19'),
                      Text('Virus Disease'),
                      Text(
                          'Pray for coronavirus victims. The virus was first reported in Wuhan, Hubai, China on 17 November 2019, and on 11 March 2020, the World Health Organization (WHO) declared the outbreak a pandemic')
                    ],
                  ),
                ),
                Lottie.asset('assets/lottie/prevention.json', height: 200)
              ],
            ),
            xs: (context, widget) => widget)
      ])
    ]));
  }
}
