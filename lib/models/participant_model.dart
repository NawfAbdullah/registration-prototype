import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';

class Participant {
  late String uuid;
  late String competition_or_workshop;
  late String team_name;
  late String college;
  late String team_member1_name;
  late String team_member1_email;
  late String team_member1_contact;

  late String team_member2_name;
  late String team_member2_email;
  late String team_member2_contact;

  late String team_member3_name;
  late String team_member3_email;
  late String team_member3_contact;

  late String team_member4_name;
  late String team_member4_email;
  late String team_member4_contact;

  late String team_member5_name;
  late String team_member5_email;
  late String team_member5_contact;
  late bool is_verified;

  Participant({
    required uuid,
    required competition_or_workshop,
    required college,
    required team_name,
    required team_member1_name,
    required team_member1_contact,
    required team_member1_email,
    isverified = false,
    team_member2_name = '',
    team_member2_contact = '',
    team_member2_email = '',
    team_member3_name = '',
    team_member3_contact = '',
    team_member3_email = '',
    team_member4_name = '',
    team_member4_contact = '',
    team_member4_email = '',
    team_member5_name = '',
    team_member5_contact = '',
    team_member5_email = '',
  });

  Participant.fromJSON(Map<String, dynamic> json)
      : uuid = json['data']['uuid'],
        team_name =
            json['data']['type'] != "package" ? json['data']['team_name'] : '',
        competition_or_workshop = json['data']['type'] == "twodayshop"
            ? json['data']['type']
            : (json['data']['type'] == "individual"
                ? json['data']['competition_or_workshop']
                : json['data']['package']),
        college = json['data']['type'] != 'twodayshop'
            ? json['data']['college']
            : 'Crescent',
        team_member1_name = json['data']['type'] != "twodayshop"
            ? json['data']['type'] == 'package'
                ? json['data']['name']
                : json['data']['team_member1_name']
            : json['data']['team_lead_name'],
        team_member1_contact = json['data']['type'] != "twodayshop"
            ? (json['data']['type'] == 'package'
                ? json['data']['contact']
                : json['data']['team_member1_contact'])
            : json['data']['team_lead_contact'],
        team_member1_email = json['data']['type'] != "twodayshop"
            ? json['data']['type'] == 'package'
                ? json['data']['email']
                : json['data']['team_member1_email']
            : json['data']['team_lead_email'],
        team_member2_name = json['data']['team_member2_name'] != null
            ? json['data']['team_member2_name']
            : '',
        team_member2_contact = json['data']['team_member2_contact'] != null
            ? json['data']['team_member2_contact']
            : '',
        team_member2_email = json['data']['team_member2_email'] != null
            ? json['data']['team_member2_email']
            : '',
        team_member3_name = json['data']['team_member3_name'] != null
            ? json['data']['team_member3_name']
            : '',
        team_member3_contact = json['data']['team_member3_contact'] != null
            ? json['data']['team_member3_contact']
            : '',
        team_member3_email = json['data']['team_member3_email'] != null
            ? json['data']['team_member3_email']
            : '',
        team_member4_name = json['data']['team_member4_name'] ?? '',
        team_member4_contact = json['data']['team_member4_contact'] ?? '',
        team_member4_email = json['data']['team_member4_email'] ?? '',
        team_member5_name = json['data']['team_member5_name'] ?? '',
        team_member5_contact = json['data']['team_member5_contact'] ?? '',
        team_member5_email = json['data']['team_member5_email'] ?? '',
        is_verified = json['data']['is_verified'];
}

Future<Participant> fetchTeam(String uuid) async {
  print("Access");
  final response = await post(
      Uri.parse(
        'https://build-club-backend-production.up.railway.app/verify-uuid',
      ),
      body: jsonEncode({"uuid": uuid}),
      headers: {
        'admin-access-code': '5cf80735-886f-4467-ad59-1be691443a1e',
        'Content-Type': 'application/json',
      });
  print("Done");
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    print('got response');
    Participant x =
        Participant.fromJSON(jsonDecode(response.body) as Map<String, dynamic>);
    return x;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print("ERRRRRRRRORRRRRRR");
    throw Exception('Failed to load user');
  }
}

Future<List<Participant>> getEventParticipant(String eventName) async {
  final response = await get(
      Uri.parse(
        "https://build-club-backend-production.up.railway.app/individual/$eventName/get-all",
      ),
      headers: {
        'admin-access-code': '5cf80735-886f-4467-ad59-1be691443a1e',
        'Content-Type': 'application/json',
      });
  print("Done");
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    print('got response');
    // var x = (jsonDecode(response.body) as List)
    //     .map((e) {
    //       print(e);
    //       return Participant.fromJSON(e);
    //     } as Map<String, dynamic>)
    //     .toList();
    // Participant.fromJSON(jsonDecode(response.body) as Map<String, dynamic>);
    List x = jsonDecode(response.body);
    print(x[0]);
    print('printed x');
    List<Participant> temp = [];
    for (var element in x) {
      Participant newPart = Participant.fromJSON(element);
      print(newPart);
      print('printed new partic');
      temp.add(newPart);
    }
    return temp;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print("ERRRRRRRRORRRRRRR");
    throw Exception('Failed to load user');
  }
}
 
 
    // "uuid": "2fd7415f-609c-46e7-abb3-ce376116f910",
    // "team_name": "Faiz",
    // "college": "B. S. Abdur Rahman Crescent Institute Of Science And Technology",
    // "team_member1_name": "Mohamed Abul Faiz",
    // "team_member1_email": "alishazin1029@gmail.com",
    // "team_member1_contact": "9003391591",
    // "team_member2_name": "Tharagaraman",
    // "team_member2_email": "tharagaraman2004@gmail.com",
    // "team_member2_contact": "8925129396",
    // "team_member3_name": "Sarvesh Giri A",
    // "team_member3_email": "sg02fitwts@gmail.com",
    // "team_member3_contact": "9150481106",
    // "team_member4_name": "Zuhair Mohamed Hussain",
    // "team_member4_email": "zuhairmh04@gmail.com",
    // "team_member4_contact": "8610696626",
    // "team_member5_name": "Ujjual Menon N P",
    // "team_member5_email": "Ujjualmenon03@gmail.com",
    // "team_member5_contact": "8075662544",
    // "is_verified": false