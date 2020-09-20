part of '../widgets.dart';

class BottomNavBarCustom extends StatelessWidget {
  final int currentIndex;
  final Function onTap;
  final List<BottomNavigationBarItem> items;

  BottomNavBarCustom({
    this.currentIndex,
    this.items,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: borderRadius8,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: mainColor,
          unselectedItemColor: greyColor,
          currentIndex: currentIndex,
          onTap: onTap,
          items: items,
        ),
      ),
    );
  }
}
