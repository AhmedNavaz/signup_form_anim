import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class FormBody extends StatefulWidget {
  const FormBody({Key? key}) : super(key: key);

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> with TickerProviderStateMixin {
  late AnimationController greenCircleAnimationController;
  late Animation<double> greenCircleAnimation;
  late AnimationController whiteCircleAnimationController;
  late Animation<double> whiteCircleAnimation;
  PageController pageController = PageController();
  int currentPageIndex = 0;

  // data
  TextEditingController _name = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _bio = TextEditingController();
  int _gender = -1;
  String country = '';
  String state = '';
  String city = '';
  String _selectedDate = DateFormat.yMMMMd('en_US').format(DateTime.now());
  bool showDate = false;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _selectedDate = DateFormat.yMMMMd('en_US').format(args.value);
      showDate = false;
    });
  }

  @override
  void initState() {
    super.initState();

    greenCircleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    greenCircleAnimation = Tween<double>(begin: 0.0, end: 2000).animate(
        CurvedAnimation(
            parent: greenCircleAnimationController, curve: Curves.easeIn));
    whiteCircleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    whiteCircleAnimation = Tween<double>(begin: 0.0, end: 2000).animate(
        CurvedAnimation(
            parent: whiteCircleAnimationController, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: AnimatedBuilder(
                animation: greenCircleAnimation,
                child: Container(
                  height: 1,
                  width: 1,
                  decoration: BoxDecoration(
                    color: const Color(0xff00DD9C),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                builder: (context, child) {
                  return Transform.scale(
                    scale: greenCircleAnimation.value,
                    child: child,
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: AnimatedBuilder(
                animation: whiteCircleAnimation,
                child: Container(
                  height: 1,
                  width: 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                builder: (context, child) {
                  return Transform.scale(
                    scale: whiteCircleAnimation.value,
                    child: child,
                  );
                }),
          ),
          PageView(
            // physics:
            //     const NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            controller: pageController,
            children: [
              name(),
              username(),
              bio(),
              gender(),
              birthday(),
              location(),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          greenCircleAnimationController.forward().then((value) {
            whiteCircleAnimationController.forward().then((value) {
              greenCircleAnimationController.reset();
              whiteCircleAnimationController.reset();
            });
          });
          currentPageIndex++;
          pageController.animateToPage(currentPageIndex,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
        backgroundColor: const Color(0xff00DD9C),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
        child: const FaIcon(FontAwesomeIcons.arrowRight),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My name is',
            style: TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 2,
                color: const Color(0xff00DBA2),
              ),
            ),
            child: TextField(
              cursorColor: const Color(0xff00DBA2),
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    color: Colors.grey.withOpacity(0.4),
                    size: 20,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 20, top: 15),
                border: InputBorder.none,
                hintText: 'Name',
                hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.4),
                    fontWeight: FontWeight.bold),
              ),
              controller: _name,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            '* Please enter the correct information.\n Your selected name cannot be modified later.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Padding username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My username will be',
            style: TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 2,
                color: const Color(0xff00DBA2),
              ),
            ),
            child: TextField(
              cursorColor: const Color(0xff00DBA2),
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    color: Colors.grey.withOpacity(0.4),
                    size: 20,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 20, top: 15),
                border: InputBorder.none,
                hintText: 'Username',
                hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.4),
                    fontWeight: FontWeight.bold),
              ),
              controller: _username,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            '* Please enter the correct information.\n Your selected username cannot be modified later.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Padding bio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'I want to say',
            style: TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 2,
                color: const Color(0xff00DBA2),
              ),
            ),
            child: TextField(
              cursorColor: const Color(0xff00DBA2),
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: FaIcon(
                    FontAwesomeIcons.speakerDeck,
                    color: Colors.grey.withOpacity(0.4),
                    size: 20,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 20, top: 15),
                border: InputBorder.none,
                hintText: 'Bio',
                hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.4),
                    fontWeight: FontWeight.bold),
              ),
              controller: _bio,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            '* Please enter the correct information.\n Your selected bio cannot be modified later.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Padding gender() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'I am a',
            style: TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            onTap: () {
              setState(() {
                _gender = 0;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: _gender == 0
                    ? Colors.lightBlueAccent
                    : const Color(0xffF9F7F9),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                'Woman',
                style: TextStyle(
                    fontSize: 24,
                    color:
                        _gender == 0 ? Colors.white : const Color(0xffCECCCE),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            onTap: () {
              setState(() {
                _gender = 1;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: _gender == 1
                    ? Colors.lightBlueAccent
                    : const Color(0xffF9F7F9),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                'Man',
                style: TextStyle(
                    fontSize: 24,
                    color:
                        _gender == 1 ? Colors.white : const Color(0xffCECCCE),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            '* Please enter the correct information.\n Your selected gender cannot be modified later.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Padding birthday() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My birthday is',
            style: TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              setState(() {
                showDate = true;
              });
            },
            child: Text(
              _selectedDate,
              style: const TextStyle(
                  color: Color(0xff00DBA2),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            '* Please enter the correct information.\n Your selected age cannot be modified later.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 50),
          Visibility(
            visible: showDate,
            child: SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.single,
            ),
          ),
        ],
      ),
    );
  }

  Padding location() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'I live in',
            style: TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SelectState(
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                onCountryChanged: (value) {
                  setState(() {
                    country = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    state = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    city = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            '* Please enter the correct information.\n Your location gender cannot be modified later.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
