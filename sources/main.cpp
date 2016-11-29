#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include <appHelper.hpp>

int main(int argc, char** argv)
{
	QGuiApplication app(argc, argv);

	AppHelper appHelper;	

	QQmlApplicationEngine engine;
	engine.rootContext()->setContextProperty("appHelper", &appHelper);
	engine.load(QGuiApplication::applicationDirPath() + "/qml/main.qml");	

	return app.exec();
}