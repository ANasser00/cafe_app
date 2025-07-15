import 'package:flutter/material.dart';

class DiscountTicketWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const DiscountTicketWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.icon,
    this.iconColor = const Color(0xFF056780),
    this.backgroundColor = Colors.white,
    this.textColor = const Color(0xFF056780),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: CustomPaint(
          painter: _TicketPainter(
            backgroundColor: backgroundColor,
            perforationColor: Colors.grey[200]!, 
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                // Title and Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: textColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                // Value
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        value.split(' ')[0], 
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      Text(
                        value.split(' ').length > 1 ? value.split(' ')[1] : '', 
                        style: TextStyle(
                          fontSize: 10,
                          color: textColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TicketPainter extends CustomPainter {
  final Color backgroundColor;
  final Color perforationColor;

  _TicketPainter({required this.backgroundColor, required this.perforationColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = backgroundColor;
    final radius = 5.0; // Radius of the "holes"
    final spacing = 10.0; // Spacing between holes

    // Draw the main rectangle
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      paint,
    );

    // Draw the perforated edge on the right side
    final path = Path();
    final dashWidth = 4.0;
    final dashSpace = 4.0;
    double currentY = radius;

    while (currentY < size.height - radius) {
      path.moveTo(size.width - radius, currentY);
      path.lineTo(size.width - radius, currentY + dashWidth);
      currentY += dashWidth + dashSpace;
    }

    final dashPaint = Paint()
      ..color = Colors.grey[300]! // Color of the dashed line
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, dashPaint);

    // Draw the circular cutouts
    final holePaint = Paint()..color = perforationColor; // Use a color that matches the background of the parent container or the page
    double holeY = 0;
    while (holeY < size.height) {
      canvas.drawCircle(Offset(size.width - radius, holeY), radius, holePaint);
      holeY += radius * 2; // Move to the next hole position
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
