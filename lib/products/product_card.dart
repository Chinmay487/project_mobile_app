import "package:flutter/material.dart";


class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc";
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.18,
      child: Card(
        elevation: 4,
        shadowColor: Color(0xffECEFF1),
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage(_imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "iPhone 12",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff263238),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "\$ 999.99",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff263238),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      highlightColor:Color(0xffCFD8DC),
                      splashColor: Color(0xff4FC3F7),
                      onTap:(){},
                      child:Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "View",
                          style: TextStyle(
                            color: Color(0xff42A5F5),
                            fontSize: 15.0,
                          ),
                        ),
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
