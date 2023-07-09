import 'package:flutter/material.dart';

class HealthHeaderListTile extends StatelessWidget {
  const HealthHeaderListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const ListTile(
      title: Text('COVID-19',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
      subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Virus Disease'),
            SizedBox(height: 20),
            Text(
                'Pray for coronavirus victims. The virus was first reported in Wuhan, Hubai, China on 17 November 2019, and on 11 March 2020, the World Health Organization (WHO) declared the outbreak a pandemic')
          ]));
}
