import "package:flutter/material.dart";

class ProductQuantity extends StatelessWidget {

  final dynamic incrementFunction;
  final dynamic decrementFunction;
  final int? quantity;
  final bool isCart;

  ProductQuantity(
      {this.incrementFunction, this.decrementFunction, this.quantity,this.isCart:false});

  Widget getOptions(){
    if(isCart){
      return Container();
    }
    return Container(
      alignment: Alignment.bottomRight,
      child: const Text(
        "Quantity : ",
        style: TextStyle(
          fontSize: 17,
          color: Color(0xff37474F),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getOptions(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuantityButton(
                    tapFunction: incrementFunction,
                    buttonIcon: Icons.add,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("$quantity",
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  QuantityButton(
                    tapFunction: decrementFunction,
                    buttonIcon: Icons.remove,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class QuantityButton extends StatelessWidget {
  final dynamic? buttonIcon;
  final dynamic? tapFunction;

  QuantityButton({this.buttonIcon, this.tapFunction});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff42A5F5),
      borderRadius: BorderRadius.circular(5.0),
      child: InkWell(
        onTap: tapFunction,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Icon(
              buttonIcon,
              color: Colors.white,
            )),
      ),
    );
  }
}

class QuantityList extends StatelessWidget {
  // const QuantityList({Key? key}) : super(key: key);

  final dynamic onQtyChangeFunction;
  final int? selectedQuantity;

  QuantityList({this.onQtyChangeFunction,this.selectedQuantity});

  @override
  Widget build(BuildContext context) {
    List<int> _qty = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return DropdownButton(
      value: selectedQuantity,
      items: _qty.map((qt) {
        return DropdownMenuItem(
            value: qt,
            child: Text("$qt"));
      }).toList(),
      onChanged: onQtyChangeFunction,
    );
  }

}
