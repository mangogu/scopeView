/****************************************************************************
** Meta object code from reading C++ file 'Inifileoperate.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.2.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../ScopeView/Inifileoperate.h"
#include <QtNetwork/QSslPreSharedKeyAuthenticator>
#include <QtNetwork/QSslError>
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Inifileoperate.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.2.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Inifileoperate_t {
    const uint offsetsAndSize[26];
    char stringdata0[109];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_Inifileoperate_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_Inifileoperate_t qt_meta_stringdata_Inifileoperate = {
    {
QT_MOC_LITERAL(0, 14), // "Inifileoperate"
QT_MOC_LITERAL(15, 11), // "QML.Element"
QT_MOC_LITERAL(27, 4), // "auto"
QT_MOC_LITERAL(32, 11), // "getFileName"
QT_MOC_LITERAL(44, 0), // ""
QT_MOC_LITERAL(45, 11), // "setFileName"
QT_MOC_LITERAL(57, 11), // "newFileName"
QT_MOC_LITERAL(69, 8), // "getValue"
QT_MOC_LITERAL(78, 5), // "group"
QT_MOC_LITERAL(84, 4), // "name"
QT_MOC_LITERAL(89, 8), // "setValue"
QT_MOC_LITERAL(98, 5), // "value"
QT_MOC_LITERAL(104, 4) // "func"

    },
    "Inifileoperate\0QML.Element\0auto\0"
    "getFileName\0\0setFileName\0newFileName\0"
    "getValue\0group\0name\0setValue\0value\0"
    "func"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Inifileoperate[] = {

 // content:
      10,       // revision
       0,       // classname
       1,   14, // classinfo
       5,   16, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // classinfo: key, value
       1,    2,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       3,    0,   46,    4, 0x102,    1 /* Public | MethodIsConst  */,
       5,    1,   47,    4, 0x02,    2 /* Public */,
       7,    2,   50,    4, 0x02,    4 /* Public */,
      10,    3,   55,    4, 0x02,    7 /* Public */,
      12,    0,   62,    4, 0x02,   11 /* Public */,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    6,
    QMetaType::QString, QMetaType::QString, QMetaType::QString,    8,    9,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,    8,    9,   11,
    QMetaType::Void,

       0        // eod
};

void Inifileoperate::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Inifileoperate *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->getFileName(); break;
        case 1: _t->setFileName((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 2: { QString _r = _t->getValue((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 3: _t->setValue((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[3]))); break;
        case 4: _t->func(); break;
        default: ;
        }
    }
}

const QMetaObject Inifileoperate::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Inifileoperate.offsetsAndSize,
    qt_meta_data_Inifileoperate,
    qt_static_metacall,
    nullptr,
qt_metaTypeArray<
Inifileoperate

, void, void, const QString &, QString, QString, QString, void, QString, QString, QString, void

>,
    nullptr
} };


const QMetaObject *Inifileoperate::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Inifileoperate::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Inifileoperate.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Inifileoperate::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
