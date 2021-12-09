import 'package:flutter/material.dart';
import 'package:flutter_app/models/user/user_model.dart';



class UserScreen extends StatelessWidget {
  List<UserModels> user = [
    UserModels(
      id: 1,
      name: 'haitham ahmed',
      phone: '01018198902',
    ),
    UserModels(
      id: 1,
      name: 'ahmed',
      phone: '01gffg018198902',
    ),
    UserModels(
      id: 3,
      name: 'haitham',
      phone: '01018198902',
    ),
    UserModels(
      id: 1,
      name: 'haitham ahmed haitham ahmed',
      phone: '0101bfdb8198902',
    ),
    UserModels(
      id: 1,
      name: 'haitham ahmed ahmed ahmed',
      phone: '01018198902',
    ),
    UserModels(
      id: 1,
      name: 'haitham ahmed',
      phone: '01018198bdf902',
    ),
    UserModels(
      id: 2,
      name: 'ahmed',
      phone: '01018198902',
    ),
    UserModels(
      id: 1,
      name: 'haitham',
      phone: '01018198902',
    ),
    UserModels(
      id: 1,
      name: 'haitham ahmed haitham ahmed',
      phone: '01018198902',
    ),
    UserModels(
      id: 1,
      name: 'haitham ahmed ahmed ahmed',
      phone: '01018198902',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => UserItem(user[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          child: Container(
            height: 1,
            // width: double.infinity,
            color: Colors.grey,
          ),
        ),
        itemCount: user.length,
      ),
    );
  }

  Widget UserItem(UserModels userData) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                child: Text(
                  '${userData.id}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userData.name}',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${userData.phone}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
