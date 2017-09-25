Ruby bindings for PCP trace PMDA & API

# DESCRIPTION

Ruby bindings of:

https://github.com/performancecopilot/pcp/blob/master/src/include/pcp/trace.h

As easy as that. Visit man page for more info:

http://pcp.io/man/man3/pmdatrace.3.html

# USAGE

	require "pcptrace"

	# reached a point in source code
	PCPTrace::point("a_point"))

	# observation of an arbitrary value
	PCPTrace::obs("an_observation", 130.513))

	# a counter - increasing or decreasing
	PCPTrace::counter("a_counter", 1))

	# time spent in a transaction (or block)
	PCPTrace::begin("a_transaction"))
	# ...
	PCPTrace::end("a_transaction"))

	# transactions must be aborted (e.g. exception)
	#PCPTrace::abort("a_transaction"))

	# all methods return non-zero code
	result = PCPTrace::counter("a_counter", -5))
	puts("Error: " + PCPTrace::errstr(result)) if result != 0

# RUBY-FRIENDLY API

Little bit more Ruby-friendly wraper:

	require 'pcptrace/kernel'
	PCPTrace::setup_kernel(true)

	pcp_point("a_point")
	pcp_observe("an_observation", 99.9)
	pcp_counter("a_counter", 10)
	pcp_counter("a_counter") # increment by 1
	pcp_measure("a_transaction") do
	  # block of code - properly aborted on exception
	end

# REQUIREMENTS

The PCP library and headers.

## Fedora

	$ dnf install ruby-devel pcp pcp-libs-devel

## Debian or Ubuntu

	$ sudo apt-get install noidea todo

# INSTALLATION

Regular rubygem:

	gem install pcptrace

When building from source:

	rake compile

# AUTHORS

* Lukas Zapletal

# LICENSE

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
