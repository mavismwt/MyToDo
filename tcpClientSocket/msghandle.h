#ifndef MSGHANDLE_H
#define MSGHANDLE_H

#include <QObject>

class MsgHandle : public QObject
{
    Q_OBJECT
public:
    explicit MsgHandle(QObject *parent = nullptr);

signals:

};

#endif // MSGHANDLE_H
