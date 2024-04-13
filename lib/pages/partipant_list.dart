import 'package:flutter/material.dart';
import 'package:registration_scanner/models/participant_model.dart';

class ParticipantList extends StatefulWidget {
  const ParticipantList({super.key});
  final competitionName = "developingdrones";
  @override
  State<ParticipantList> createState() => _ParticipantListState();
}

class _ParticipantListState extends State<ParticipantList> {
  late Future<List<Participant>> x;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    x = getEventParticipant("developingdrones");
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
