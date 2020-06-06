import 'package:covid_19_app/constants.dart';
import 'package:covid_19_app/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildDetailsAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 21),
                            blurRadius: 53,
                            color: Colors.black.withOpacity(0.05)),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      buildTitleWithIcon(),
                      SizedBox(height: 15),
                      buildNumerCase(context),
                      SizedBox(height: 15),
                      Text(
                        "From Health Center",
                        style: TextStyle(
                            color: kTextMediumColor,
                            fontWeight: FontWeight.w200,
                            fontSize: 16),
                      ),
                      SizedBox(height: 15),
                      WeeklyChart(),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          buildInfoTextWithPercent(
                              title: "From Last Week", percentage: "6.43%"),
                          buildInfoTextWithPercent(
                              title: "RecoveryRate", percentage: "98%"),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 21),
                          blurRadius: 54,
                          color: Colors.black.withOpacity(0.05)),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Global Map",
                            style: TextStyle(fontSize: 15),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: kPrimaryColor,
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      SvgPicture.asset("assets/icons/map.svg")
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  RichText buildInfoTextWithPercent({String title, String percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: "$percentage \n",
              style: TextStyle(color: kPrimaryColor, fontSize: 20)),
          TextSpan(
              text: title,
              style: TextStyle(color: kTextMediumColor, height: 1.5))
        ],
      ),
    );
  }

  Row buildNumerCase(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "547",
          style: Theme.of(context)
              .textTheme
              .display3
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text("5.9% ", style: TextStyle(color: kPrimaryColor)),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTitleWithIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "New Cases",
          style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Icon(
          Icons.more_vert,
          color: kPrimaryColor,
        )
      ],
    );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
      ),
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        )
      ],
    );
  }
}
