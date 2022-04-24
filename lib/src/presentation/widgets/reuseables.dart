import 'package:flutter/material.dart';

const empty = SizedBox();
// ignore: prefer_function_declarations_over_variables, no-empty-block
final noop = () {};

class SizedW extends SizedBox {
  const SizedW(double w, {Key? key}) : super(key: key, width: w);
}

class SizedH extends SizedBox {
  const SizedH(double h, {Key? key}) : super(key: key, height: h);
}

const sizedW = SizedW(4);
const sizedH = SizedH(4);
const sizedW4 = SizedW(4);
const sizedH4 = SizedH(4);
const sizedW8 = SizedW(8);
const sizedH8 = SizedH(8);
const sizedW16 = SizedW(16);
const sizedH16 = SizedH(16);
const sizedW20 = SizedW(20);
const sizedH20 = SizedH(20);
const sizedW24 = SizedW(24);
const sizedH24 = SizedH(24);
const sizedW32 = SizedW(32);
const sizedH32 = SizedH(32);
const sizedW40 = SizedW(40);
const sizedH40 = SizedH(40);
const sizedW48 = SizedW(48);
const sizedH48 = SizedH(48);
const sizedW56 = SizedW(56);
const sizedH56 = SizedH(56);
const sizedW64 = SizedW(64);
const sizedH64 = SizedH(64);
