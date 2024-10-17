import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final Color? overlayColor;
  final bool enabled;
  final EdgeInsets? contentPadding;

  const PrimaryButton({
    super.key,
    required this.child,
    this.onTap,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.overlayColor,
    this.enabled = true,
    this.contentPadding,
  });

  ButtonStyle getStyle() {
    return ButtonStyle(
      enableFeedback: true,
      overlayColor: MaterialStateColor.resolveWith(
          (states) => overlayColor ?? const Color(0xFFF2F2F2).withOpacity(0.2)),
      padding: MaterialStateProperty.all(
        contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
          side: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.blue;
        }
        return backgroundColor; // Defer to the widget's default.
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.white;
        }
        return foregroundColor; // Defer to the widget's default.
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            child: TextButton(
          style: getStyle(),
          onPressed: enabled
              ? () {
                  onTap?.call();
                }
              : null,
          child: child,
        )),
      ],
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final Color? overlayColor;
  final EdgeInsets? contentPadding;

  const SecondaryButton({
    super.key,
    required this.child,
    this.onTap,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.overlayColor,
    this.contentPadding,

  });

  ButtonStyle getStyle() {
    return ButtonStyle(
      enableFeedback: true,
      overlayColor: MaterialStateColor.resolveWith(
          (states) => overlayColor ?? const Color(0xFFF2F2F2).withOpacity(0.2)),
      padding: MaterialStateProperty.all(
        contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.blue;
        }
        return backgroundColor; // Defer to the widget's default.
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.white;
        }
        return foregroundColor; // Defer to the widget's default.
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: getStyle(),
            onPressed: () {
              onTap?.call();
            },
            child: child,
          ),
        ),
      ],
    );
  }
}
