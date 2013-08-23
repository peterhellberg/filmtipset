# encoding: utf-8

require_relative '../spec_helper'

describe Filmtipset::VERSION do
  subject { Filmtipset::VERSION }

  it "returns a version string" do
    subject.must_match(/^\d+\.\d+\.\d+$/)
  end
end
