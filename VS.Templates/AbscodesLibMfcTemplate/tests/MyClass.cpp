#include "stdafx.h"
#include "CppUnitTest.h"

#include <afxwin.h> // MFC core and standard components
#include "AbscodesLibMfcTemplate\MyClass.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace abscodes::AbscodesLibMfcTemplate;

namespace AbscodesLibMfcTemplateTests {


TEST_CLASS(MyClass_Tests) {
public:
    TEST_METHOD(getTrue) {
        MyClass myClass;

        Assert::IsTrue(myClass.getTrue());
    }

    TEST_METHOD(getFalse) {
        MyClass myClass;

        Assert::IsFalse(myClass.getFalse());
    }
};
} // namespace AbscodesLibMfcTemplateTests
