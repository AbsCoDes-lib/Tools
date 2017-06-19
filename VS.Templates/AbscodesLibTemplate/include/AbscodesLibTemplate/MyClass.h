//===--- MyClass.h -----------------------------------------------------------------------------------*- C++ -*-===//     
//
// This source file is part of the Absolute Codes Design open source projects
//
// Copyright (c) 2016 Absolute Codes Design and the project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://raw.githubusercontent.com/AbsCoDes/AbsCoDes.github.io/master/Licence.txt for license information
//
//===-------------------------------------------------------------------------------------------------------------===//


#ifndef MyClass_INCLUDED
#define MyClass_INCLUDED


#include "AbscodesLibTemplate\AbscodesLibTemplate.h"


namespace AbsCoDes {
namespace AbscodesLibTemplate {


// Put the class description here
class AbscodesLibTemplate_API MyClass
{
public:
    MyClass();
    virtual ~MyClass();

public:
	bool getTrue();
	bool getFalse();
};

} // namespace AbscodesLibTemplate
} // namespace AbsCoDes


#endif // MyClass_INCLUDED

