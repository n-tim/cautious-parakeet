#ifndef APPHELPER_HPP
#define APPHELPER_HPP

#include <QtCore/QObject>
#include <QtCore/QString>

class AppHelper : public QObject
{
	Q_OBJECT

public:
	AppHelper(QObject* parent = NULL);

public:
	Q_INVOKABLE QString getHelloString();
};

#endif