import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/view/screens/booking_screen/booking_screen.dart';
import 'package:gofreindsgo_sales/view_model/bookings_viewmodel.dart';

import 'package:provider/provider.dart';

class BookingDetailsSearch extends StatelessWidget {
  const BookingDetailsSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 350,
            child: SearchBar(
              onChanged: (value) {
                context.read<BookingViewModel>().filterBookings(value);
              },
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              hintText: 'Search By Clients Name',
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color: const Color.fromARGB(255, 238, 230, 230),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.2), // Shadow color
              //     spreadRadius: 2, // Spread of the shadow
              //     blurRadius: 6, // Blurring of the shadow
              //     offset: const Offset(
              //         0, 3), // Position of the shadow (horizontal, vertical)
              //   ),
              // ],
            ),
            width: 50,
            height: 50,
            padding: const EdgeInsets.only(left: 0.0, top: 0.0, right: 2.0, bottom: 0.0),
            child: const Icon(Icons.format_align_center),
          ),

        ],
      ),
    );
  }
}
