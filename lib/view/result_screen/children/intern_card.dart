import 'package:flutter/material.dart';
import 'package:intern_trip/data_models/intern_data.dart';
import 'package:intern_trip/view/result_screen/detail_result_screen.dart';

class InternCard extends StatelessWidget {
  final Intern intern;

  const InternCard({
    super.key,
    required this.intern,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.pink,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailResultScreen(intern: intern),
          ),
        );
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  'assets/images/intern_image.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 5.0,
                    children: [
                      Chip(label: Text(intern.industry)),
                      Chip(label: Text(intern.occupation)),
                      Chip(label: Text(intern.venue)),
                    ],
                  ),
                  Text(
                    intern.eventName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    intern.eventContents,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '????????? ${intern.company}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Text(
                        '??????????????? ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          '${intern.startDate.year}???${intern.startDate.month}???${intern.startDate.day}???'),
                      const Text('???'),
                      Text(
                          '${intern.endDate.year}???${intern.endDate.month}???${intern.endDate.day}???'),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
