#include "stdafx.h"
#include "CppUnitTest.h"

#include "AbscodesLibTemplate\MyClass.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace AbsCoDes::AbscodesLibTemplate;

namespace AbscodesLibTemplateTests
{		
	TEST_CLASS(MyClass_Tests)
	{
	public:
		
		TEST_METHOD(getTrue)
		{
			MyClass myClass;

			Assert::IsTrue(myClass.getTrue());
		}

	};
}