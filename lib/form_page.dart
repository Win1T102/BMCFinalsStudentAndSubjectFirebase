import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// ============================================================
// SCREEN 1
// USER REGISTRATION
// ============================================================

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({super.key});

  @override
  State<UserRegistrationPage> createState() =>
      _UserRegistrationPageState();
}

class _UserRegistrationPageState
    extends State<UserRegistrationPage> {

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController sectionController =
      TextEditingController();

  final TextEditingController courseController =
      TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    sectionController.dispose();
    courseController.dispose();

    super.dispose();
  }


  void nextPage() {

    if (nameController.text.trim().isEmpty ||
        sectionController.text.trim().isEmpty ||
        courseController.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please complete all fields.',
          ),
        ),
      );

      return;
    }


    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) =>
            SubjectEnrollmentPage(

          name: nameController.text.trim(),

          section: sectionController.text.trim(),

          course: courseController.text.trim(),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'User Registration',
        ),

        centerTitle: true,
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(24),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const SizedBox(height: 20),


            const Text(
              'Student Information',

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 30),


            // NAME

            TextField(

              controller: nameController,

              decoration: const InputDecoration(

                labelText: 'Name',

                hintText:
                    'Enter your name',

                prefixIcon:
                    Icon(Icons.person),

                border:
                    OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 20),


            // SECTION

            TextField(

              controller: sectionController,

              decoration: const InputDecoration(

                labelText: 'Section',

                hintText:
                    'Enter your section',

                prefixIcon:
                    Icon(Icons.class_),

                border:
                    OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 20),


            // COURSE

            TextField(

              controller: courseController,

              decoration: const InputDecoration(

                labelText: 'Course',

                hintText:
                    'Enter your course',

                prefixIcon:
                    Icon(Icons.school),

                border:
                    OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 35),


            // NEXT

            SizedBox(

              width: double.infinity,

              height: 50,

              child: ElevatedButton(

                onPressed: nextPage,

                child: const Text(
                  'Next',

                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// ============================================================
// SCREEN 2
// SUBJECT ENROLLMENT
// ============================================================

class SubjectEnrollmentPage extends StatefulWidget {

  final String name;

  final String section;

  final String course;


  const SubjectEnrollmentPage({

    super.key,

    required this.name,

    required this.section,

    required this.course,
  });


  @override
  State<SubjectEnrollmentPage> createState() =>
      _SubjectEnrollmentPageState();
}


class _SubjectEnrollmentPageState
    extends State<SubjectEnrollmentPage> {


  final TextEditingController subject1Controller =
      TextEditingController();

  final TextEditingController time1Controller =
      TextEditingController();


  final TextEditingController subject2Controller =
      TextEditingController();

  final TextEditingController time2Controller =
      TextEditingController();


  @override
  void initState() {

    super.initState();


    // Default values from your whiteboard

    subject1Controller.text = 'BNC';

    time1Controller.text =
        '7:30 - 10:30';


    subject2Controller.text = 'A1';

    time2Controller.text =
        '10:30 - 1:30';
  }


  @override
  void dispose() {

    subject1Controller.dispose();

    time1Controller.dispose();

    subject2Controller.dispose();

    time2Controller.dispose();

    super.dispose();
  }


  void nextPage() {

    if (subject1Controller.text.trim().isEmpty ||
        time1Controller.text.trim().isEmpty ||
        subject2Controller.text.trim().isEmpty ||
        time2Controller.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please complete all subject fields.',
          ),
        ),
      );

      return;
    }


    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (context) =>
            SubjectVerificationPage(

          name: widget.name,

          section: widget.section,

          course: widget.course,


          subject1:
              subject1Controller.text.trim(),

          time1:
              time1Controller.text.trim(),


          subject2:
              subject2Controller.text.trim(),

          time2:
              time2Controller.text.trim(),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'Subject Enrollment',
        ),

        centerTitle: true,
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(24),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              'Select Subjects',

              style: TextStyle(

                fontSize: 24,

                fontWeight:
                    FontWeight.bold,
              ),
            ),


            const SizedBox(height: 30),


            // SUBJECT 1

            const Text(

              'Subject 1',

              style: TextStyle(

                fontSize: 18,

                fontWeight:
                    FontWeight.bold,
              ),
            ),


            const SizedBox(height: 10),


            TextField(

              controller:
                  subject1Controller,

              decoration:
                  const InputDecoration(

                labelText: 'Subject',

                prefixIcon:
                    Icon(Icons.book),

                border:
                    OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 15),


            TextField(

              controller:
                  time1Controller,

              decoration:
                  const InputDecoration(

                labelText: 'Time',

                prefixIcon:
                    Icon(Icons.access_time),

                border:
                    OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 30),


            // SUBJECT 2

            const Text(

              'Subject 2',

              style: TextStyle(

                fontSize: 18,

                fontWeight:
                    FontWeight.bold,
              ),
            ),


            const SizedBox(height: 10),


            TextField(

              controller:
                  subject2Controller,

              decoration:
                  const InputDecoration(

                labelText: 'Subject',

                prefixIcon:
                    Icon(Icons.book),

                border:
                    OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 15),


            TextField(

              controller:
                  time2Controller,

              decoration:
                  const InputDecoration(

                labelText: 'Time',

                prefixIcon:
                    Icon(Icons.access_time),

                border:
                    OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 35),


            // NEXT BUTTON

            SizedBox(

              width: double.infinity,

              height: 50,

              child: ElevatedButton(

                onPressed: nextPage,

                child: const Text(

                  'Next',

                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// ============================================================
// SCREEN 3
// SUBJECT VERIFICATION
// ============================================================

class SubjectVerificationPage
    extends StatefulWidget {

  final String name;

  final String section;

  final String course;


  final String subject1;

  final String time1;


  final String subject2;

  final String time2;


  const SubjectVerificationPage({

    super.key,

    required this.name,

    required this.section,

    required this.course,


    required this.subject1,

    required this.time1,


    required this.subject2,

    required this.time2,
  });


  @override
  State<SubjectVerificationPage> createState() =>
      _SubjectVerificationPageState();
}


class _SubjectVerificationPageState
    extends State<SubjectVerificationPage> {


  bool isSaving = false;


  // ==========================================================
  // SAVE TO FIREBASE
  // ==========================================================

  Future<void> saveEnrollment() async {

    setState(() {
      isSaving = true;
    });


    try {

      await FirebaseFirestore.instance
          .collection('students')
          .add({

        'name': widget.name,

        'section': widget.section,

        'course': widget.course,


        'subjects': [

          {
            'subject':
                widget.subject1,

            'time':
                widget.time1,
          },


          {
            'subject':
                widget.subject2,

            'time':
                widget.time2,
          },

        ],


        'createdAt':
            FieldValue.serverTimestamp(),
      });


      if (!mounted) return;


      showDialog(

        context: context,

        barrierDismissible: false,

        builder: (context) {

          return AlertDialog(

            title: const Text(
              'Success',
            ),

            content: const Text(
              'Your subject enrollment has been saved successfully.',
            ),

            actions: [

              TextButton(

                onPressed: () {

                  Navigator.pop(context);


                  Navigator.popUntil(

                    context,

                    (route) =>
                        route.isFirst,
                  );
                },

                child: const Text(
                  'OK',
                ),
              ),
            ],
          );
        },
      );

    } catch (error) {

      if (!mounted) return;


      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(

          content: Text(
            'Failed to save enrollment: $error',
          ),
        ),
      );
    }


    if (mounted) {

      setState(() {

        isSaving = false;
      });
    }
  }



  // ==========================================================
  // INFORMATION ROW
  // ==========================================================

  Widget infoRow(
    String label,
    String value,
  ) {

    return Padding(

      padding:
          const EdgeInsets.symmetric(
        vertical: 8,
      ),

      child: Row(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          SizedBox(

            width: 90,

            child: Text(

              '$label:',

              style: const TextStyle(

                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),


          Expanded(

            child: Text(
              value,
            ),
          ),
        ],
      ),
    );
  }



  // ==========================================================
  // SUBJECT CARD
  // ==========================================================

  Widget subjectCard(

    int number,

    String subject,

    String time,

  ) {

    return Card(

      elevation: 2,

      child: Padding(

        padding:
            const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(

              '$number. $subject',

              style: const TextStyle(

                fontSize: 18,

                fontWeight:
                    FontWeight.bold,
              ),
            ),


            const SizedBox(height: 8),


            Row(

              children: [

                const Icon(
                  Icons.access_time,
                  size: 20,
                ),


                const SizedBox(width: 8),


                Text(

                  time,

                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'Subject Verification',
        ),

        centerTitle: true,
      ),


      body: SingleChildScrollView(

        padding:
            const EdgeInsets.all(24),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              'Details',

              style: TextStyle(

                fontSize: 24,

                fontWeight:
                    FontWeight.bold,
              ),
            ),


            const SizedBox(height: 20),


            // STUDENT DETAILS

            Card(

              child: Padding(

                padding:
                    const EdgeInsets.all(16),

                child: Column(

                  children: [

                    infoRow(
                      'Name',
                      widget.name,
                    ),

                    infoRow(
                      'Section',
                      widget.section,
                    ),

                    infoRow(
                      'Course',
                      widget.course,
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 30),


            const Text(

              'Subjects',

              style: TextStyle(

                fontSize: 22,

                fontWeight:
                    FontWeight.bold,
              ),
            ),


            const SizedBox(height: 15),


            subjectCard(

              1,

              widget.subject1,

              widget.time1,
            ),


            const SizedBox(height: 10),


            subjectCard(

              2,

              widget.subject2,

              widget.time2,
            ),


            const SizedBox(height: 35),


            // SAVE BUTTON

            SizedBox(

              width: double.infinity,

              height: 52,

              child: ElevatedButton.icon(

                onPressed:
                    isSaving
                        ? null
                        : saveEnrollment,

                icon: isSaving

                    ? const SizedBox(

                        width: 20,

                        height: 20,

                        child:
                            CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )

                    : const Icon(
                        Icons.save,
                      ),

                label: Text(

                  isSaving
                      ? 'Saving...'
                      : 'Save',

                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}