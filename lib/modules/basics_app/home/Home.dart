import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.build),
        title: Text('Hi'),
        actions: [
          Icon(Icons.settings),
          IconButton(
            icon: Text('Hi'),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Container(
              width: 200,
              height: 200,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__340.jpg'),
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(.4),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'hkh',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
