import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget{
 final int currentIndex;
 final Function(int) onTap;
 const NavBar({
   super.key,
   required this.currentIndex,
   required this.onTap,
});


  @override
  Widget build(BuildContext context) {
   return Container(
     height: 70,
     color: const Color(0xFF1C3486),
     child:Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         _navItem(icon: Icons.group, label: "Marks", index: 0, context: context),
         _navItem(icon: Icons.schedule, label: "Schedul", index: 1, context: context),
         _navItem(icon: Icons.home, label: "Home", index: 2, context: context),
         _navItem(icon: Icons.task, label: "Tasks", index: 3, context: context),
         _navItem(icon: Icons.person, label: "Profile", index: 4, context: context),
       ],
     ) ,
   );
  }
  Widget _navItem({
   required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
})
  {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF007F6D) // ← لون الاختيار
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

}