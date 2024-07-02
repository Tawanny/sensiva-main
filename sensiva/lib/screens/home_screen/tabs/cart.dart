import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:ui_common/ui_common.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Cart',
                style: context.displayMedium.copyWith(
                  color: ThemeColors.textColor,
                  fontSize: 35,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Card(
                  elevation: 10,
                  color: ThemeColors.prColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: Text(
                      'CHECK OUT',
                      style: context.bodyMedium.copyWith(
                        color: ThemeColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          ListTile(
            title: Text(
              'Subtotal',
              style: context.bodyMedium.copyWith(
                color: ThemeColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              'R850.00',
              style: context.titleSmall.copyWith(
                color: ThemeColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Delivery',
              style: context.bodyMedium.copyWith(
                color: ThemeColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              'R50.00',
              style: context.titleSmall.copyWith(
                color: ThemeColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Total',
              style: context.bodyMedium.copyWith(
                color: ThemeColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              'R900.00',
              style: context.titleMedium.copyWith(
                color: ThemeColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(color: ThemeColors.selectedColor),
          const Gap(10),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                CartItem(
                  itemName: 'Hemp Energy Drink',
                  price: 60.00,
                  imageUrl: 'assets/images/weed_drink.png',
                  quantity: 1,
                ),
                CartItem(
                  itemName: 'Wild Camomile and Pineapple Muffins',
                  price: 50.00,
                  imageUrl: 'assets/images/muffins.jpeg',
                  quantity: 1,
                ),
                CartItem(
                  itemName: 'Scout Girl Cookies buds',
                  price: 120.00,
                  imageUrl: 'assets/images/strains.png',
                  quantity: 1,
                ),
                CartItem(
                  itemName: 'Wild Camomile and Pineapple Muffins',
                  price: 50.00,
                  imageUrl: 'assets/images/muffins.jpeg',
                  quantity: 1,
                ),
                CartItem(
                  itemName: 'Scout Girl Cookies buds',
                  price: 120.00,
                  imageUrl: 'assets/images/strains.png',
                  quantity: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  CartItem({
    super.key,
    required this.itemName,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
  final String itemName;
  final double price;
  final String imageUrl;
  int quantity;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    var total = widget.price * widget.quantity;

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.selectedColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        isThreeLine: true,
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(widget.imageUrl),
        ),
        title: Text(
          widget.itemName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.bodyLarge.copyWith(
            color: ThemeColors.textColor,
          ),
        ),
        subtitle: Text(
          'R${widget.price.toStringAsFixed(2)}',
          style: context.bodyMedium.copyWith(
            color: ThemeColors.textColor,
          ),
        ),
        trailing: SizedBox(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.quantity = widget.quantity - 1;
                      });
                    },
                    child: const Icon(
                      IconlyLight.plus,
                      color: ThemeColors.btnColor,
                      size: 20,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    '${widget.quantity}',
                    style: context.titleSmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.textColor,
                    ),
                  ),
                  const Gap(5),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.quantity = widget.quantity + 1;
                      });
                    },
                    child: const Icon(
                      IconlyLight.plus,
                      color: ThemeColors.btnColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Text(
                'R${total.toStringAsFixed(2)}',
                style: context.bodyMedium.copyWith(
                  color: ThemeColors.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
