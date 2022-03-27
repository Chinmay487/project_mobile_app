import "package:flutter/material.dart";

class AddressCard extends StatelessWidget {
  // const AddressCard({Key? key}) : super(key: key);

  final bool isProfile;

  AddressCard({this.isProfile:true});

  dynamic getDeleteButton(){
    if(isProfile){
      return Expanded(
        child: IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: MediaQuery.of(context).size.width*0.09,
      ),
      child: SizedBox(
        // width: MediaQuery.of(context).size.width * 0.5,
        child: Card(
          color: Color(0xffEEEEEE),
          elevation: 5,
          shadowColor: Color(0xffCFD8DC),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child:Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Address Line 1"),
                        Text("Address Line 2"),
                        Text("City"),
                        Text("District"),
                        Text("State"),
                        Text("Pin code")
                      ],
                    ),
                  )
              ),
              getDeleteButton(),
            ],
          ),
        ),
      ),
    );
  }
}
