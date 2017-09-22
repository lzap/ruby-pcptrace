#include <ruby.h>
#include <pcp/trace.h>

VALUE pcp = Qnil;

static VALUE rb_ext_begin(VALUE self, VALUE str_id)
{
  return INT2NUM(pmtracebegin(StringValueCStr(str_id)));
}

static VALUE rb_ext_end(VALUE self, VALUE str_id)
{
  return INT2NUM(pmtraceend(StringValueCStr(str_id)));
}

static VALUE rb_ext_abort(VALUE self, VALUE str_id)
{
  return INT2NUM(pmtraceabort(StringValueCStr(str_id)));
}

static VALUE rb_ext_point(VALUE self, VALUE str_id)
{
  return INT2NUM(pmtracepoint(StringValueCStr(str_id)));
}

static VALUE rb_ext_errstr(VALUE self, VALUE int_code)
{
  return rb_str_new_cstr(pmtraceerrstr(NUM2INT(int_code)));
}

static VALUE rb_ext_counter(VALUE self, VALUE str_id, VALUE double_val)
{
  return INT2NUM(pmtracecounter(StringValueCStr(str_id), NUM2DBL(double_val)));
}

static VALUE rb_ext_obs(VALUE self, VALUE str_id, VALUE double_val)
{
  return INT2NUM(pmtraceobs(StringValueCStr(str_id), NUM2DBL(double_val)));
}

static VALUE rb_ext_state(VALUE self, VALUE int_code)
{
  return INT2NUM(pmtracestate(NUM2INT(int_code)));
}

void Init_pcptrace(){
  pcp = rb_define_module("PCPTrace");
  rb_define_module_function(pcp, "begin", rb_ext_begin, 1);
  rb_define_module_function(pcp, "end", rb_ext_end, 1);
  rb_define_module_function(pcp, "abort", rb_ext_abort, 1);
  rb_define_module_function(pcp, "point", rb_ext_point, 1);
  rb_define_module_function(pcp, "counter", rb_ext_counter, 2);
  rb_define_module_function(pcp, "obs", rb_ext_obs, 2);
  rb_define_module_function(pcp, "errstr", rb_ext_errstr, 1);
  rb_define_module_function(pcp, "state", rb_ext_state, 1);

  rb_define_const(pcp, "STATE_NONE", INT2NUM(PMTRACE_STATE_NONE));
  rb_define_const(pcp, "STATE_API", INT2NUM(PMTRACE_STATE_API));
  rb_define_const(pcp, "STATE_COMMS", INT2NUM(PMTRACE_STATE_COMMS));
  rb_define_const(pcp, "STATE_PDU", INT2NUM(PMTRACE_STATE_PDU));
  rb_define_const(pcp, "STATE_PDUBUF", INT2NUM(PMTRACE_STATE_PDUBUF));
  rb_define_const(pcp, "STATE_NOAGENT", INT2NUM(PMTRACE_STATE_NOAGENT));
  rb_define_const(pcp, "STATE_ASYNC", INT2NUM(PMTRACE_STATE_ASYNC));
}
