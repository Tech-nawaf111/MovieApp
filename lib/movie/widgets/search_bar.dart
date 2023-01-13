// import 'package:flutter/cupertino.dart';
// import 'package:anim_search_bar/anim_search_bar.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'bloc/search_cubit.dart';
// class AppSearchBar extends StatefulWidget {
//
//   AppSearchBar({super.key,required this.searchController,required this.openState});
// TextEditingController searchController;
// bool openState;
//   @override
//   _SearchBarState createState() => _SearchBarState();
// }
//
// class _SearchBarState extends State<AppSearchBar> {
//   bool isOpen = false;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//       AnimSearchBar(
//       width: 400,
//       textController: widget.searchController,
//       rtl: true,
//       textFieldColor:  Colors.white,
//       onSuffixTapone: () {
//         print("clicked first time");
//         context.read<SearchCubit>().toChange(true);
//         setState(() {
//           isOpen = !isOpen;
//     widget.openState = !widget.openState;
//           if (kDebugMode) {
//             print(widget.searchController.text);
//           }
//           widget.searchController.clear();
//         });
//       },
//         onSuffixTaptwo: () {
//           setState(() {
//             isOpen = !isOpen;
//             widget.openState = !widget.openState;
//             if (kDebugMode) {
//           print("clicked 2nd time");
//             }
//           });
//         },
//       // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
//       onSubmitted: (String) {},
//
//
//     ),
//         Positioned(top: 45, child:Visibility(
//             visible: isOpen,
//     child: Text("Watch",style: GoogleFonts.poppins(fontSize: 18)))
//         ),
//       ]
//     );
//
//   }
// }