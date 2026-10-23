import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';

class RoundImage extends StatefulWidget {
  final String? imageUrl;
  final String? symbol;
  final double size;
  final bool isLoading;
  final double opacity;

  const RoundImage({super.key, this.imageUrl, this.size = 35, this.isLoading = false, this.opacity = 1, this.symbol});

  @override
  State<RoundImage> createState() => _RoundImageState();
}

class _RoundImageState extends State<RoundImage> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.opacity,
      child: Builder(
        builder: (_) {
          return _buildSymbolContainer();
        },
      ),
    );
  }

  Widget _buildSymbolContainer() {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(color: appColors.surface, shape: BoxShape.circle),
      child: Center(
        child: Builder(
          builder: (_) {
            String symbol = widget.symbol ?? '';
            if (symbol.isNotEmpty) {
              return Text(
                symbol.length > 3 ? symbol.substring(0, 3) : symbol,
                style: TextStyle(color: appColors.primary, fontSize: widget.size * 0.4, fontWeight: FontWeight.bold),
              );
            }
            return FaIcon(FontAwesomeIcons.question, color: Colors.white, size: widget.size * 0.6);
          },
        ),
      ),
    );
  }
}
