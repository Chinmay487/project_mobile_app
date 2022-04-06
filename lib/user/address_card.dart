import "package:flutter/material.dart";

class AddressCard extends StatelessWidget {
  final bool isProfile;
  final String? addressLine1, addressLine2, city, district, state, pincode;
  final dynamic? onDeleteCall,index;

  AddressCard(
      {this.isProfile = true,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.district,
      this.state,
      this.pincode,
      this.onDeleteCall,this.index});

  dynamic getDeleteButton() {
    if (isProfile) {
      return Expanded(
        child: IconButton(
          onPressed: (){
            onDeleteCall(index);
          },
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
        horizontal: MediaQuery.of(context).size.width * 0.09,
      ),
      child: SizedBox(
        // width: MediaQuery.of(context).size.width * 0.5,
        child: Card(
          color: const Color(0xffEEEEEE),
          elevation: 5,
          shadowColor: const Color(0xffCFD8DC),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(addressLine1!),
                        Text(addressLine2!),
                        Text(city!),
                        Text(district!),
                        Text(state!),
                        Text(pincode!)
                      ],
                    ),
                  )),
              getDeleteButton(),
            ],
          ),
        ),
      ),
    );
  }
}
