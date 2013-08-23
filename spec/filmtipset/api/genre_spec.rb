# encoding: utf-8

require_relative '../../spec_helper'

describe Filmtipset::Api::Genre do
  subject { Filmtipset::Api::Genre }

  describe "valid_id?" do
    it "returns true for valid id" do
      subject.valid_id?(4).must_equal true
    end

    it "returns false for invalid id" do
      subject.valid_id?(88).must_equal false
    end
  end

  describe "verify_id" do
    it "should raise an exception for invalid id" do
      -> { subject.verify_id(123) }.
        must_raise Filmtipset::Api::Genre::InvalidId
    end

    it "returns nil for valid id" do
      subject.verify_id(1).must_be_nil
    end
  end

  it "has a table of 29 genres" do
    subject::TABLE.size.must_equal 29
  end
end
