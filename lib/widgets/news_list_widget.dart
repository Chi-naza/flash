import 'package:flutter/material.dart';











































































// class NewsListWidget extends StatelessWidget {
//   // final Widget Function(BuildContext, int) builder;
  
//   const NewsListWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             floating: true,
//             snap: false,
//             expandedHeight: 250,
//             title: Text("News In A Flash"),
//             backgroundColor: Colors.teal,
//             flexibleSpace: FlexibleSpaceBar(
//               // title: Text("All Your News In A Flash"),
//               // background: Image.asset('assets/images/economy.jpg', fit: BoxFit.cover,),
//               background: Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/economy.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Text(
//                       "All your news in a flash news in a flash news in a flash news in a flash", 
//                       style: TextStyle(color: Colors.red, fontSize: 30),
//                     )
//                   ),
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) => ListTile(
//                 tileColor: (index%2 == 0)? Colors.grey : Colors.lightBlue,
//                 title: Text("Magical with dynamic no.$index"),
//               ),
//               childCount: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }