class NdarrayTest < Test::Unit::TestCase
  sub_test_case("Numpy::NDArray#[]") do
    sub_test_case("when the result is a view") do
      def test_
        omit("TODO")
      end
    end

    sub_test_case("when the result is a scalar value") do
      data("Integer" => [[1, 2, 3], :int64,   Integer],
           "Float64"   => [[1, 2, 3], :float64, Float],
           "Float32"   => [[1, 2, 3], :float32, Float])
      def test_(data)
        ary, dtype, klass = data
        assert_kind_of(klass, Numpy.asarray(ary, dtype: dtype)[0])
      end
    end
  end
end
