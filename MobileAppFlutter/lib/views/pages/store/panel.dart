import 'package:flutter/material.dart';

// class Panel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<>>(
//       future: ,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData)
//           return Center(child: CircularProgressIndicator());

//         return GridView.count(
//           crossAxisCount: 3,
//           children: snapshot.data
//               .map((data) => BookGridTile(
//                     author: data.author,
//                     title: data.title,
//                     thumbnailUrl: data.thumbnailUrl != null
//                         ? data.thumbnailUrl
//                         : noImageLinks,
//                   ))
//               .toList(),
//         );
//       },
//     );
//   }
// }