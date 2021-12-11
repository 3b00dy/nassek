// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nassek/colors.dart';
import 'package:nassek/providers.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
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
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(size.width * 0.04),
                  child: TextField(
                    onChanged: (_) => {},
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: colors.blue, width: size.width * 0.004),
                            borderRadius: BorderRadius.circular(15)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(15)),
                        // enabledBorder: OutlineInputBorder(
                        //     borderSide: const BorderSide(
                        //         color: Colors.grey, width: 0.5),
                        //     borderRadius: BorderRadius.circular(15)),
                        prefixIcon: const Icon(Iconsax.search_normal_1),
                        hintText: 'ابحث عن وجبات',
                        hintTextDirection: TextDirection.rtl,
                        label: const Text('بحث')),
                  ),
                ),
                SizedBox(
                  child: ListTile(
                    onTap: () {
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
                            height: size.height*0.15,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Consumer<Changing>(
                                      builder: (context, mealCount, child) {
                                        return Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                child: IconButton(
                                                  // style: ButtonStyle(
                                                  //   backgroundColor: MaterialStateProperty.all(colors.grey)
                                                  // ),
                                                  onPressed: () {
                                                    mealCount.quantityIncrement();
                                                  },
                                                  icon: Icon(Iconsax.add,
                                                      color: colors.black),
                                                  // label: Text(''),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(size.width*0.01),
                                              child: Text(
                                                '${mealCount.quantity}',
                                                style: TextStyle(
                                                    fontSize: size.width * 0.07)
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.all(size.width*0.01),
                                              child: SizedBox(
                                                child: IconButton(
                                                  onPressed: () {
                                                    mealCount.quantityDecrement();
                                                  },
                                                  icon: Icon(Iconsax.minus,
                                                      color: colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              size.width * 0.04),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                colors.blue),
                                      ),
                                      onPressed: () => {},
                                      child: const Text(
                                        'تأكيد',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              size.width * 0.04),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                colors.deepGrey),
                                      ),
                                      onPressed: () => {

                                        Navigator.pop(context)
                                      },
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
                            ),
                          ));
                      showDialog(context: context, builder: (_) => alert);
                    },
                    title: const Text('اسم الوجبة'),
                    subtitle: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('دهون'),
                            Text('سعرات حرارية'),
                            Text('بروتين'),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
