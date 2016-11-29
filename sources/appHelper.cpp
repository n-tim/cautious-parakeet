#include "appHelper.hpp"

AppHelper::AppHelper(QObject* parent)
	: QObject(parent)
{}

QString AppHelper::getHelloString()
{
	return "hello from c++";
}