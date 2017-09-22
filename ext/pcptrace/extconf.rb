require 'mkmf'

extension_name = "pcptrace"
dir_config(extension_name)
have_library("pcp_trace", "pmtracestate")
create_makefile(extension_name)
