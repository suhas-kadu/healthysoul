// import 'dart:async';

// import 'package:flutter/material.dart';

// class Searchbar extends StatefulWidget {
//   TextEditingController searchTextEditingController;
//   StreamController<bool> buttonClearController;
//   String textSearch;

//   Searchbar(
//       {Key? key,
//       required this.textSearch,
//       required this.buttonClearController,
//       required this.searchTextEditingController})
//       : super(key: key);

//   @override
//   State<Searchbar> createState() => _SearchbarState();
// }

// class _SearchbarState extends State<Searchbar> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: 50,
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               margin: const EdgeInsets.only(left: 12, right: 8),
//               height: 50,
//               child: TextFormField(
//                 textInputAction: TextInputAction.search,
//                 controller: searchTextEditingController,
//                 decoration: InputDecoration(
//                     label: const Text("Search"),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8))),
//                 onChanged: (value) {
//                   if (value.isNotEmpty) {
//                     buttonClearController.add(true);
//                     if (mounted) {
//                       setState(() {
//                         textSearch = value;
//                       });
//                     }
//                   } else {
//                     buttonClearController.add(false);
//                     if (mounted) {
//                       setState(() {
//                         textSearch = "";
//                       });
//                     }
//                   }
//                 },
//               ),
//             ),
//           ),
//           StreamBuilder(
//               stream: buttonClearController.stream,
//               builder: (context, snapshot) {
//                 return snapshot.data == true
//                     ? GestureDetector(
//                         onTap: () {
//                           searchTextEditingController.clear();
//                           buttonClearController.add(false);
//                           if (mounted) {
//                             setState(() {
//                               textSearch = '';
//                             });
//                           }
//                         },
//                         child: const Padding(
//                           padding: EdgeInsets.only(right: 12.0),
//                           child: Icon(
//                             Icons.clear,
//                             size: 20,
//                           ),
//                         ),
//                       )
//                     : const SizedBox.shrink();
//               })
//         ],
//       ),
//     );
//   }
// }


