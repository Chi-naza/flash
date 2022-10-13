import 'package:flash/widgets/text_num_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w*0.03),
          child: Column(
            children: [
              SizedBox(height: h*0.06),
              Container(             
                child: Row(
                  children: [
                    // the image
                    CircleAvatar(
                      foregroundImage: AssetImage('assets/images/sport.jpg'),
                      radius: h*0.07,
                    ),
                    SizedBox(width: w*0.05),
                    // the username & email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TheAlphanumeric',
                          style: TextStyle(
                            fontSize: h*0.03,  
                            fontWeight: FontWeight.w700,                        
                          ),
                        ),
                        SizedBox(height: h*0.018),
                        Container(
                          width: w*0.5,
                          child: Text(
                            'yourRealemailHere@gmail.com',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: h*0.019,  
                              // fontWeight: FontWeight.w700,                        
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w*0.05, vertical: h*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextNumWidget(
                      number: '826', 
                      text: 'Followers' 
                    ),
                    TextNumWidget(
                      number: '251', 
                      text: 'Following' 
                    ),
                    TextNumWidget(
                      number: '81K', 
                      text: 'News Read' 
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}