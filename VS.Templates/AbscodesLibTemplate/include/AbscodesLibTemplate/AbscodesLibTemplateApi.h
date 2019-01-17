//===--- ABSCODES_LIB_PREPROCESSOR_API.h ---------------------------------------------------------------*- C++ -*-===//
//
// This source file is part of the Absolute Codes Design open source projects
//
// Copyright (c) 2016-2019 Absolute Codes Design and the project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://raw.githubusercontent.com/AbsCoDes/AbsCoDes.github.io/master/Licence.txt for license information
//
//===-------------------------------------------------------------------------------------------------------------===//


#ifndef ABSCODES_LIB_PREPROCESSOR_API_INCLUDED
#define ABSCODES_LIB_PREPROCESSOR_API_INCLUDED

#if _MSC_VER > 1000
#    pragma once
#endif // _MSC_VER > 1000


//
// By default this library is intended to be used as a DLL
// To use it as a static library add ABSCODES_LIB_PREPROCESSOR_STATIC to your preprocessor list
//


//
// Ensure that Visual Studio is used
//
#if !defined(_MSC_VER)
#    error "This set of tools only works with Visual Studio"
#endif


// Ensure that we build with the multithreaded
// versions of the runtime libraries
#if defined(_MSC_VER) && !defined(_MT)
#    error Must compile with /MD, /MDd, /MT or /MTd
#endif


//
// Ensure that ABSCODES_LIB_PREPROCESSOR_DLL is default unless ABSCODES_LIB_PREPROCESSOR_STATIC is defined
//
#if defined(_WIN32) && defined(_DLL)
#    if !defined(ABSCODES_LIB_PREPROCESSOR_DLL) && !defined(ABSCODES_LIB_PREPROCESSOR_STATIC)
#        define ABSCODES_LIB_PREPROCESSOR_DLL
#    endif
#endif


//
// The following block is the standard way of creating macros which make exporting
// from a DLL simpler. All files within this DLL are compiled with the ABSCODES_LIB_PREPROCESSOR_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see
// ABSCODES_LIB_PREPROCESSOR_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
//
#if defined(_WIN32) && defined(ABSCODES_LIB_PREPROCESSOR_DLL)
#    ifdef ABSCODES_LIB_PREPROCESSOR_EXPORTS
#        define ABSCODES_LIB_PREPROCESSOR_API __declspec(dllexport)
#    else
#        define ABSCODES_LIB_PREPROCESSOR_API __declspec(dllimport)
#    endif
#endif


#if !defined(ABSCODES_LIB_PREPROCESSOR_API)
#    define ABSCODES_LIB_PREPROCESSOR_API
#endif


//
// Automatically link AbscodesLibTemplate library.
//
#if defined(_MSC_VER)
#    if defined _WIN64
#        define X64_SUFFIX "_x64"
#    else
#        define X64_SUFFIX ""
#    endif

#    if defined(ABSCODES_LIB_PREPROCESSOR_DLL)
#        if defined(_DEBUG)
#            define ABSCODES_LIB_PREPROCESSOR_LIB_SUFFIX X64_SUFFIX "_d"
#        else
#            define ABSCODES_LIB_PREPROCESSOR_LIB_SUFFIX X64_SUFFIX ""
#        endif
#    elif defined(_DLL)
#        if defined(_DEBUG)
#            define ABSCODES_LIB_PREPROCESSOR_LIB_SUFFIX X64_SUFFIX "_mdd"
#        else
#            define ABSCODES_LIB_PREPROCESSOR_LIB_SUFFIX X64_SUFFIX "_md"
#        endif
#    else
#        if defined(_DEBUG)
#            define ABSCODES_LIB_PREPROCESSOR_LIB_SUFFIX X64_SUFFIX "_mtd"
#        else
#            define ABSCODES_LIB_PREPROCESSOR_LIB_SUFFIX X64_SUFFIX "_mt"
#        endif
#    endif

#    if !defined(ABSCODES_LIB_PREPROCESSOR_NO_AUTOLIB) && !defined(ABSCODES_LIB_PREPROCESSOR_EXPORTS)
#        pragma comment(lib, "AbscodesLibTemplate" ABSCODES_LIB_PREPROCESSOR_LIB_SUFFIX ".lib")
#        pragma message("Automatically linking with AbscodesLibTemplate" ABSCODES_LIB_PREPROCESSOR_LIB_SUFFIX ".lib")
#    endif
#endif


// Reduce bloat
#if defined(_WIN32) && !defined(WIN32_LEAN_AND_MEAN)
#    define WIN32_LEAN_AND_MEAN
#endif


// Including SDKDDKVer.h defines the highest available Windows platform.
// If you wish to build your application for a previous Windows platform, include WinSDKVer.h and
// set the _WIN32_WINNT macro to the platform you wish to support before including SDKDDKVer.h.
#include <SDKDDKVer.h>

#endif // ABSCODES_LIB_PREPROCESSOR_API_INCLUDED
