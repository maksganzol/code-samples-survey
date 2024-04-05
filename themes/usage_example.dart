// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import '../../../../../extensions/build_context_extension.dart';
import '../../../../design_system.dart';

class DSPrimaryButton extends StatefulWidget {
  const DSPrimaryButton({
    required this.child,
    this.onPressed,
    this.color,
    this.width,
    this.height,
    this.radius,
    this.padding,
    this.isLoading = false,
    super.key,
  });

  final Widget child;
  final Color? color;
  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsets? padding;
  final bool isLoading;
  final Future<VoidCallback?> Function()? onPressed;

  @override
  State<DSPrimaryButton> createState() => _DSPrimaryButtonState();
}

class _DSPrimaryButtonState extends State<DSPrimaryButton> {
  late bool _isLoading;

  @override
  void initState() {
    super.initState();

    _isLoading = widget.isLoading;
  }

  @override
  void didUpdateWidget(covariant DSPrimaryButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      _isLoading = widget.isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDisable = widget.onPressed == null;
    final colorState =
        _isLoading ? context.color.mainPressed : widget.color ?? context.color.mainColor;

    return DSPress(
      onPressed: isDisable
          ? null
          : () async {
              late VoidCallback? onDefault;

              if (mounted && !_isLoading) setState(() => _isLoading = true);
              onDefault = await widget.onPressed?.call();
              if (mounted && _isLoading) setState(() => _isLoading = false);
              onDefault?.call();
            },
      child: AnimatedContainer(
        width: widget.width ?? double.infinity,
        height: widget.height ?? DSHeight.p48,
        duration: const Duration(milliseconds: 5),
        decoration: BoxDecoration(
          color: isDisable ? context.color.lightGrey : colorState,
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.radius ?? DSRadius.r90,
            ),
          ),
        ),
        child: Center(
          child: !isDisable && _isLoading
              ? SizedBox(
                  width: DSWidth.p16,
                  height: DSWidth.p16,
                  child: const DSProgressIndicator(),
                )
              : widget.child,
        ),
      ),
    );
  }
}
