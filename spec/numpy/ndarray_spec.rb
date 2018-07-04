require 'spec_helper'

RSpec.describe Numpy::NDArray do
  describe "#[]" do
    context "when the result is a view" do
      pending
    end

    context "when the result is a scalar value" do
      specify do
        ary = Numpy.asarray([1, 2, 3], dtype: :int64)
        expect(ary[0]).to be_a(Integer)

        ary = Numpy.asarray([1, 2, 3], dtype: :float64)
        expect(ary[0]).to be_a(Float)

        ary = Numpy.asarray([1, 2, 3], dtype: :float32)
        expect(ary[0]).to be_a(Float)
      end
    end
  end
end
