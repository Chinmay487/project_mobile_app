import "package:flutter/material.dart";
import "../api/user_info_api.dart";

class AddressForm extends StatefulWidget {
  final String? idToken;
  final dynamic? afterFormSubmit;
  final bool? lengthOfAddress;

  AddressForm({this.idToken, this.afterFormSubmit, this.lengthOfAddress});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  bool submitButtonState = false;
  String? addressLine1, addressLine2, city, district, state, pincode;

  void onFormSubmit() async {
    setState(() {
      submitButtonState = true;
    });
    var formValidation = _formKey.currentState!.validate();
    if (formValidation) {
      await addNewAddress(
        idToken: widget.idToken,
        line1: addressLine1,
        line2: addressLine2,
        city: city,
        district: district,
        state: state,
        pin: pincode,
      );
      await widget.afterFormSubmit();
      // print("$addressLine1 $addressLine2 $city $district $state $pincode");
    }
  }

  dynamic getFunction() {
    if (widget.lengthOfAddress!) {
      return onFormSubmit;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 20.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  addressLine1 = value;
                });
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill This";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Address Line 1",
                labelText: "Address Line 1",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  addressLine2 = value;
                });
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill This";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Address Line 2",
                labelText: "Address Line 2",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  city = value;
                });
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill This";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "City",
                labelText: "City",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  district = value;
                });
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill This";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "District",
                labelText: "District",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  state = value;
                });
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill This";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "State",
                labelText: "State",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  pincode = value;
                });
              },
              validator: (value) {
                final pinRegex = RegExp(
                    r"^[1-9]{1}[0-9]{5}|[1-9]{1}[0-9]{3}\\s[0-9]{3}$/im");
                bool res = pinRegex.hasMatch(value!);
                if (value == "" && value.length < 6 && !res) {
                  return "please put valid pin code";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "pin code",
                labelText: "pin code",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            submitButtonState
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: getFunction(),
                    child: const Text(
                      "Add",
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// class AddressFormField extends StatelessWidget {
//   final dynamic onInputChangeFunction;
//   final String? hintText;
//   final String? labelText;
//   final dynamic validatorFunction;
//
//   AddressFormField({this.hintText,this.labelText,this.onInputChangeFunction,this.validatorFunction});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//           onChanged: onInputChangeFunction,
//           validator:(value){
//             validatorFunction(value);
//           },
//           decoration: InputDecoration(
//             hintText: hintText!,
//             labelText: labelText!,
//           ),
//         ),
//         const SizedBox(height: 15,),
//       ],
//     );
//   }
// }
//
