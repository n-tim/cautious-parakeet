// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

#include "appHelper.hpp"

AppHelper::AppHelper(QObject* parent)
	: QObject(parent)
{}

QString AppHelper::getHelloString()
{
	unsigned int d = 0;
	for (uint i = 0; i < 2; ++i)
	{
		d += -i;
	}

	int x = 0;
	if (x == x)
	{
		return "x == x";
	}

	return "hello from c++";
}