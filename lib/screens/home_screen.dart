import 'package:covid19_information_app/constants.dart';
import 'package:covid19_information_app/screens/details_screen.dart';
import 'package:covid19_information_app/widgets/info_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: <Widget>[
                  InfoCard(
                    effectedNum: 1069,
                    title: "Confirmed Cases",
                    iconColor: const Color(0xFFFF8C00),
                    press: () {},
                  ),
                  InfoCard(
                    effectedNum: 75,
                    title: "Total Deaths",
                    iconColor: const Color(0xFFFF2D55),
                    press: () {},
                  ),
                  InfoCard(
                    effectedNum: 689,
                    title: "Total Recovered",
                    iconColor: const Color(0xFF50E3C2),
                    press: () {},
                  ),
                  InfoCard(
                    effectedNum: 52,
                    title: "New Cases",
                    iconColor: const Color(0xFF5856D6),
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DetailsScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Preventions",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  buildPreventations(),
                  const SizedBox(height: 40),
                  buildHelpCard(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildPreventations() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        PreventionCard(
          text: "Wash Hands",
          image: "assets/icons/hand_wash.svg",
        ),
        PreventionCard(
          text: "Use Mask",
          image: "assets/icons/use_mask.svg",
        ),
        PreventionCard(
          text: "Clean Disinfect",
          image: "assets/icons/Clean_Disinfect.svg",
        ),
      ],
    );
  }

  buildHelpCard(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .4,
                right: 20,
                top: 20),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF60BE93), Color(0xFF1B8D59)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Dial 999 for \n medical Help! \n",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                      text: "If any simptoms appear",
                      style: TextStyle(color: Colors.white.withOpacity(0.7)))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset("assets/icons/nurse.svg"),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        )
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String? text;
  final String? image;

  const PreventionCard({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(image!),
        Text(
          text!,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
