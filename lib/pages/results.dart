import 'package:flutter/material.dart';
import 'package:registration_scanner/constants/constants.dart';
import 'package:registration_scanner/models/participant_model.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({super.key, required this.uuid});
  final uuid;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Future<Participant> team;

  Future<Participant> fetchScanned() async {
    print("cover");
    return await fetchTeam(widget.uuid);
  }

  @override
  void initState() {
    // TODO: implement initState
    team = fetchTeam(widget.uuid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: team,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasData) {
                print("xxxxx");
                print(snapshot.data);
                return Scaffold(
                  appBar: AppBar(title: Text('Results')),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => Navigator.pop(context),
                    child: Icon(Icons.check),
                  ),
                  body: ListView(
                    children: [
                      Text(
                        'Team Name : ${snapshot.data?.team_name}',
                        style: kTitleText,
                      ),
                      Text(
                        'College: ${snapshot.data?.college}',
                        style: kSubText,
                      ),
                      Text('Event: ${snapshot.data?.competition_or_workshop}'),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(5, 5), color: Colors.black)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Text(
                              'Name:${snapshot.data?.team_member1_name}',
                              textAlign: TextAlign.left,
                              style: kSubText,
                            ),
                            Text(
                              "Email: ${snapshot.data?.team_member1_email}",
                              textAlign: TextAlign.left,
                              style: kSubText,
                            ),
                            Text(
                              "Contact: ${snapshot.data?.team_member1_contact}",
                              textAlign: TextAlign.left,
                              style: kSubText,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(5, 5), color: Colors.black)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Text(
                              'Name:${snapshot.data?.team_member2_name}',
                              textAlign: TextAlign.left,
                              style: kSubText,
                            ),
                            Text(
                              "Email: ${snapshot.data?.team_member2_email}",
                              style: kSubText,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Contact: ${snapshot.data?.team_member2_contact}",
                              style: kSubText,
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(5, 5), color: Colors.black12)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Text(
                              'Name:${snapshot.data?.team_member3_name}',
                              style: kSubText,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Email: ${snapshot.data?.team_member3_email}",
                              style: kSubText,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Contact: ${snapshot.data?.team_member3_contact}",
                              style: kSubText,
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5, 5),
                                color: Colors.black12,
                                spreadRadius: 10,
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Text(
                              'Name:${snapshot.data?.team_member4_name}',
                              style: kSubText,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Email: ${snapshot.data?.team_member4_email}",
                              style: kSubText,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Contact: ${snapshot.data?.team_member4_contact}",
                              style: kSubText,
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Text('Error: ${snapshot.error}');
              }
          }
        });
  }
}


// Container(
//       color: Colors.white,
//       child: Column(
//         children: [
//           Text(
//             team.team_name,
//             style: TextStyle(
//               decoration: TextDecoration.none,
//               color: Colors.black,
//               fontSize: 16,
//             ),
//           ),
//           Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(color: Colors.grey, offset: Offset(10, 10)),
//               ],
//             ),
//             width: MediaQuery.of(context).size.width * 0.98,
//             child: const Column(children: [
//               Text(
//                 "Nawf Abdullah",
//                 style: TextStyle(
//                   decoration: TextDecoration.none,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//               Text(
//                 "Package: Standard",
//                 style: TextStyle(
//                   decoration: TextDecoration.none,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//               Text(
//                 "competitions",
//                 style: TextStyle(
//                   decoration: TextDecoration.none,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//               Text(
//                 "workshops",
//                 style: TextStyle(
//                   decoration: TextDecoration.none,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ]),
//           )
//         ],
//       ),
//     );