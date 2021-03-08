#! /usr/bin/env ruby

$VERBOSE = true

require "fileutils"
require "pathname"

base_dir = Pathname.new(__dir__).parent.expand_path

lib_dir = base_dir + "lib"
test_dir = base_dir + "test"

$LOAD_PATH.unshift(lib_dir.to_s)

require_relative "helper"

ENV["TEST_UNIT_MAX_DIFF_TARGET_STRING_SIZE"] ||= "10000"

exit(Test::Unit::AutoRunner.run(true, test_dir.to_s))
