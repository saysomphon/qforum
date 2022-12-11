import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/screens/brainstom_post_it/widgets/note_card.dart';
import 'package:qfoumn/screens/note_editor/note_editor_screen.dart';
import 'package:qfoumn/screens/note_reader.dart/note_reader_screen.dart';
import 'package:qfoumn/widgets/loading_get_data.dart';
import 'package:qfoumn/widgets/something_went_wrong.dart';

class BranstormPostItScreen extends StatefulWidget {
  const BranstormPostItScreen({super.key});

  @override
  State<BranstormPostItScreen> createState() => _BranstormPostItScreenState();
}

class _BranstormPostItScreenState extends State<BranstormPostItScreen> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> postStream =
        FirebaseFirestore.instance.collection("brainstorm_post_it").snapshots();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(PaddingConstant.scaffoldPadding),
        child: StreamBuilder<QuerySnapshot>(
          stream: postStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const SomethingWentWrong();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingGetData();
            }

            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: snapshot.data!.docs
                  .map((note) => noteCard(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NoteReaderScreen(doc: note)));
                      }, note))
                  .toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoteEditorScreen()));
        },
        backgroundColor: ColorsConstant.darkPrimaryColor,
        label: const Text(
          "Add note",
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
