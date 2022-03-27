import "package:flutter/material.dart";

class AddressForm extends StatelessWidget {
  const AddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20.0,),
      child: Column(
        children: [
          AddressFormField(
            onInputChangeFunction: (value){},
            hintText: "Address Line 1",
            labelText: "Address Line 1",
          ),
          AddressFormField(
            onInputChangeFunction: (value){},
            hintText: "Address Line 2",
            labelText: "Address Line 2",
          ),
          AddressFormField(
            onInputChangeFunction: (value){},
            hintText: "City",
            labelText: "City",
          ),
          AddressFormField(
            onInputChangeFunction: (value){},
            hintText: "District",
            labelText: "District",
          ),
          AddressFormField(
            onInputChangeFunction: (value){},
            hintText: "State",
            labelText: "State",
          ),
          AddressFormField(
            onInputChangeFunction: (value){},
            hintText: "Pin Code",
            labelText: "Pin Code",
          ),
          ElevatedButton(
              onPressed: (){},
              child:const Text(
                  "Add",
              )
          ),
        ],
      ),
    );
  }
}

class AddressFormField extends StatelessWidget {
  final dynamic onInputChangeFunction;
  final String? hintText;
  final String? labelText;

  AddressFormField({this.hintText,this.labelText,this.onInputChangeFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: onInputChangeFunction,
          decoration: InputDecoration(
            hintText: hintText!,
            labelText: labelText!,
          ),
        ),
        const SizedBox(height: 15,),
      ],
    );
  }
}

