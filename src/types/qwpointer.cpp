#include "qwpointer.h"
#include "qwinputdevice_p.h"
#include "private/qwglobal_p.h"
extern "C" {
#include <wlr/types/wlr_pointer.h>
QW_SIGNAL(motion, arguments?)
QW_SIGNAL(motion_absolute, arguments?)
QW_SIGNAL(button, arguments?)
QW_SIGNAL(axis, arguments?)
QW_SIGNAL(frame, arguments?)
QW_SIGNAL(swipe_begin, arguments?)
QW_SIGNAL(swipe_update, arguments?)
QW_SIGNAL(swipe_end, arguments?)
QW_SIGNAL(pinch_begin, arguments?)
QW_SIGNAL(pinch_update, arguments?)
QW_SIGNAL(pinch_end, arguments?)
QW_SIGNAL(hold_begin, arguments?)
QW_SIGNAL(hold_end, arguments?)
QW_FUNC_MEMBER(pointer, from_input_device)
