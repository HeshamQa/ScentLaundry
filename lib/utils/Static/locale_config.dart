import 'package:flutter/cupertino.dart';
import '../../generated/l10n.dart';

class LocaleConfig{
  bool _isAr=false;

  bool get isAr => _isAr;

  set isAr(bool value) {
    _isAr = value;
  }

  static String getCategoryAtIndex(String index,BuildContext context) {
    switch (index) {
      case 'Drying':
        return S.of(context).Drying;
      case 'Bag':
        return S.of(context).Bag;
      case 'Washing & Ironing':
        return S.of(context).WashingIroning;
      case 'Quilt':
        return S.of(context).Quilt;
      case 'Sewing':
        return S.of(context).Sewing;
      case 'Ironing':
        return S.of(context).Ironing;
      case 'Car':
        return S.of(context).Car;
      case 'Carpet':
        return S.of(context).Carpet;
      default:
        return ''; // Handle any other cases as needed
    }
  }
}