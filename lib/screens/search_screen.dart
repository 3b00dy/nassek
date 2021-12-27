// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nassek/Provider_classes/add_food_provider.dart';
import 'package:nassek/Provider_classes/days_provider.dart';
import 'package:nassek/Provider_classes/food_provider.dart';
import 'package:nassek/colors.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  String tag;

  Search({Key? key, required this.tag}) : super(key: key);

  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: colors.blue,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.04),
                    child: Consumer<FoodProvider>(
                      builder: (context, search, _) {
                        return TextField(
                          onChanged: (val) => {search.foodSearching(val)},
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: colors.blue,
                                      width: size.width * 0.004),
                                  borderRadius: BorderRadius.circular(15)),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.5),
                                  borderRadius: BorderRadius.circular(15)),
                              prefixIcon: const Icon(Iconsax.search_normal_1),
                              hintText: 'ابحث عن وجبات',
                              // hintTextDirection: TextDirection.rtl,
                              label: const Text('بحث')),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: size.height * 0.76,
                    child: Consumer<FoodProvider>(
                        builder: (context, foodValues, _) {
                      return SizedBox(
                        child: ListView.builder(
                            itemCount: foodValues.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  buildAlertDialog(size, context,
                                      foodValues.foodSearchinModel[index].id);
                                },
                                title: Text(
                                    '${foodValues.foodSearchinModel[index].name}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                            '${foodValues.foodSearchinModel[index].description}'),
                                      ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text('دهون'),
                                        Text('سعرات حرارية'),
                                        Text('بروتين'),
                                      ],
                                    ),
                                  Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                              '${foodValues.foodSearchinModel[index].fat}'),
                                          Text(
                                              '${foodValues.foodSearchinModel[index].calories}'),
                                          Text(
                                              '${foodValues.foodSearchinModel[index].protein}'),
                                        ],
                                      ),
                                  ],
                                ),
                              );
                            }),
                      );
                    }),
                  )
                ],
              ),
            )));
  }

  void buildAlertDialog(Size size, BuildContext context, id) {
    AlertDialog alert = AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "اختر الكمية",
            ),
          ],
        ),
        content: SizedBox(
          height: size.height * 0.15,
          child:
              Consumer<AddFoodProvider>(builder: (context, mealCount, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () {
                                mealCount.quantityIncrement();
                              },
                              icon: Icon(Iconsax.add, color: colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Text('${mealCount.quantity}',
                              style: TextStyle(fontSize: size.width * 0.07)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () {
                                mealCount.quantityDecrement();
                              },
                              icon: Icon(Iconsax.minus, color: colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.04),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(colors.blue),
                      ),
                      onPressed: () => {

                        mealCount.addFood(id, tag, mealCount.quantity),
                        Provider.of<DaysProvider>(context,listen: false).getDay(),
                Provider.of<DaysProvider>(context,listen: false).refresh=true,
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            'navigationBar', (Route<dynamic> route) => false),
                        mealCount.quantity = 1,
                      },
                      child: const Text(
                        'تأكيد',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.04),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(colors.deepGrey),
                      ),
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text(
                        'الغاء',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
        ));
    showDialog(context: context, builder: (_) => alert);
  }
}
