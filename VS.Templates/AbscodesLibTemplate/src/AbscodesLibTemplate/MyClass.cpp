//===--- MyClass.cpp ---------------------------------------------------------------------------------*- C++ -*-===//
//
// This source file is part of the Absolute Codes Design open source projects
//
// Copyright (c) 2016-2019 Absolute Codes Design and the project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://raw.githubusercontent.com/AbsCoDes/AbsCoDes.github.io/master/Licence.txt for license information
//
//===-------------------------------------------------------------------------------------------------------------===//


#include "AbscodesLibTemplate\MyClass.h"


namespace abscodes {
namespace AbscodesLibTemplate {

  MyClass::MyClass() {
    // This kind of comment (//) will
    // not be visible in doxygen docs

    // so you can freely use it to comment
    // your code inside your functions
  }

  MyClass::~MyClass() {}

  bool MyClass::getTrue() {
    return getBoolean(true);
  }

  bool MyClass::getFalse() {
    return getBoolean(false);
  }

  bool MyClass::getBoolean(bool boolean) {
    return boolean;
  }

} // namespace AbscodesLibTemplate
} // namespace abscodes
