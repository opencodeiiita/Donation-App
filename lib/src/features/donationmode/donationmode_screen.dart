import 'package:donation_app/src/common_widgets/bigbutton.dart';
import 'package:donation_app/src/features/intro/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widgets/textfield.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('dd/MM/yy');


class DonationMode extends StatefulWidget {
  const DonationMode({super.key});

  @override
  State<DonationMode> createState() => _DonationModeState();
}



class _DonationModeState extends State<DonationMode> {
  TextEditingController phoneController=TextEditingController(text: "");
  DateTime? _selectedDate;
  void _datePicker() async {
    final currentDate = DateTime.now();
    final firstDate =
    DateTime(currentDate.year-1, currentDate.month, currentDate.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: firstDate,
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFF209FA6), // <-- SEE HERE
                onPrimary: Colors.white, // <-- SEE HERE
                onSurface: Colors.black, // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Color(0xFF209FA6), // button text color
                ),
              ),
            ),
          child: child!,
        );
      },
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donation Mode", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w600),),
        leading: const BackButton(),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const Spacer(),
            const Center(
              child: Text(
                "How would you like to Send\nyour Donation ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 20,),
            BigButton(
              press: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child :SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 560,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Please enter Pickup Details",
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 20,),
                                CustomTextField(
                                  h: 50,
                                  fieldname: 'Your Phone',
                                  controller: phoneController,
                                ),
                                SizedBox(height: 10,),
                                CustomTextField(
                                  h: 100,
                                  fieldname: 'Pickup Address',
                                  controller: phoneController,
                                ),
                                SizedBox(height: 10,),
                                CustomTextField(
                                  h: 50,
                                  fieldname: 'Landmark(Optional)',
                                  controller: phoneController,
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Spacer(),
                                      Text(_selectedDate == null
                                        ? "No Date Selected"
                                        : formatter.format(_selectedDate!),
                                      ),
                                      Spacer(),
                                      IconButton(
                                          onPressed: _datePicker,
                                          icon: const Icon(Icons.calendar_today)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                SizedBox(height: 10,),
                                BigButton(
                                    press: (){},
                                    buttonname: "Continue",
                                ),
                                SizedBox(height: 10,),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text("Back",style: TextStyle(color: Colors.grey),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              buttonname: "Pick Up"),
            const SizedBox(height: 10,),
            BigButton(press: (){}, buttonname: "Drop Off"),


            const Spacer(),
          ],
        ),
      ),

    );
  }
}
