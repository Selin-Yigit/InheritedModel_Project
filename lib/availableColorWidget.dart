import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inheritedmodel_project/homePage.dart';
import 'dart:developer' as devtools show log;

class AvailableColorWidget extends InheritedModel<AvailableColors> {
  final MaterialColor color1;
  final MaterialColor color2;

  const AvailableColorWidget(
      {Key? key,
      required Widget child,
      required this.color1,
      required this.color2})
      : super(key: key, child: child);

  // Bu fonksiyon sadece inherited modelin nesli tarafından kullanılır. Inhertited model kendi kullanmaz.
  // Inhertited modelin instances'ının bir kopyası children'lara verilir.
  static AvailableColorWidget of(BuildContext context, AvailableColors aspect) {
    return InheritedModel.inheritFrom<AvailableColorWidget>(context,
        aspect: aspect)!;
  }

  @override
  bool updateShouldNotify(covariant AvailableColorWidget oldWidget) {
    // eski instance ile yeni instance karşılaştırılır.
    // Yani bu uygulama için color1 ve color2'nin değişim durumu incelenir.

    devtools.log('updateShouldNotify'); // debug konsolunda
    return color1 != oldWidget.color1 || color2 != oldWidget.color2;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant AvailableColorWidget oldWidget,
    Set<AvailableColors> dependencies,
  ) {
    // Bu fonksiyon "updateShouldNotify" fonksiyonu true döndüğünde çalışır. Amacı hangi color'ın değiştiğini öğrenmektir.
    // Çünkü "updateShouldNotify" fonksiyonu tüm aspect'leri karşılaştırır
    //fakat hangisinin değiştiğini bize söylemez sadece değişim olduğunu bildirir.
    devtools.log('updateShouldNotifyDependent');
    if (dependencies.contains(AvailableColors.one) &&
        color1 != oldWidget.color1) {
      return true;
    }
    if (dependencies.contains(AvailableColors.two) &&
        color2 != oldWidget.color2) {
      return true;
    }
    return false;
  }
}
