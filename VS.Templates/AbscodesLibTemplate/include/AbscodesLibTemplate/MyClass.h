//===--- MyClass.h -------------------------------------------------------------------------------------*- C++ -*-===//
//
// This source file is part of the Absolute Codes Design open source projects
//
// Copyright (c) 2016-2017 Absolute Codes Design and the project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://raw.githubusercontent.com/AbsCoDes/AbsCoDes.github.io/master/Licence.txt for license information
//
//===-------------------------------------------------------------------------------------------------------------===//


#ifndef MyClass_INCLUDED
#define MyClass_INCLUDED


#include "AbscodesLibTemplate\AbscodesLibTemplateApi.h"


namespace AbsCoDes {
namespace AbscodesLibTemplate {


/// 
/// Put the class description here
/// 
/// Use three / if you are using doxygen
/// 
/// For more info on doxygen commands, see :
///    http://doxygen.nl/docblocks.html
/// 
class AbscodesLibTemplate_API MyClass
{
public:
	/// Constructor.
    MyClass();
	/// Destructor.
    ~MyClass();

public:
	/// Always return true.
	bool getTrue();

	/// @brief	Always return false.
	///
	/// @see getBoolean()
	///
	/// @return	false always
	bool getFalse();

	/// @brief	Return the boolean value.
	///
	/// @param boolean The boolean value which will be returned
	///
	/// @return	true or false depending on the parameter
	bool getBoolean(bool boolean);
};

} // namespace AbscodesLibTemplate
} // namespace AbsCoDes


#endif // MyClass_INCLUDED

