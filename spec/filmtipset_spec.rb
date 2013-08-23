# encoding: utf-8

require_relative 'spec_helper'

describe Filmtipset do
  subject { Filmtipset }

  describe "api" do
    it "returns a (default) api object" do
      subject.api.must_be_instance_of Filmtipset::Api
    end
  end
end
