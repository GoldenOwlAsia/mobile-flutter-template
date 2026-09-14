import 'package:material_ui/material_ui.dart';
import 'package:shimmer/shimmer.dart';

class XShimmer extends StatelessWidget {
  const XShimmer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      loop: 10,
      child: child,
    );
  }
}
