import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/components/d4uIndex.dart';
import 'package:flutter/material.dart';

class D4uProfileAvartarTile extends StatelessWidget {
  D4uProfileAvartarTile({
    Key? key,
    this.userImage = '',
    this.userName,
    this.userEmail = '',
    this.isSeller = true,
  }) : super(key: key);

  String userImage;
  String? userName;
  String? userEmail;
  bool isSeller;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundImage: AssetImage(userImage),
            radius: 30,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            D4uText(
              text: userName,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            D4uText(
              text: userEmail,
              fontSize: 16,
              color: d4uGray,
            ),
            Container(
              height: 20,
              width: 68,
              margin: D4uPadding.v4,
              color: Colors.transparent,
              child: isSeller
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(
                          color: d4uPrimaryColor,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Seller",
                          style:
                              TextStyle(color: d4uPrimaryColor, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        )
      ],
    );
  }
}
