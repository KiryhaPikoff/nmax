#include "nmax.h"

VALUE rb_mNmax;

void
Init_nmax(void)
{
  rb_mNmax = rb_define_module("Nmax");
}
