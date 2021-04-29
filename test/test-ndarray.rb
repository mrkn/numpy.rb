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

  sub_test_case("Numpy::NDArray#to_a") do
    test("for 1-D array") do
      a = Numpy.asarray([1, 2, 3, 4, 5])
      r = a.to_a
      assert_equal({
                     class: Array,
                     values: [1, 2, 3, 4, 5]
                   },
                   {
                     class: r.class,
                     values: r
                   })
    end

    test("for 2-D array") do
      a = Numpy.asarray([[1, 2, 3], [4, 5, 6]])
      r = a.to_a
      assert_equal({
                     class: [Array, Array, Array],
                     values: [[1, 2, 3], [4, 5, 6]]
                   },
                   {
                     class: [r.class, r[0].class, r[1].class],
                     values: r
                   })
    end

    test("for 3-D array") do
      a = Numpy.asarray([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])
      r = a.to_a
      assert_equal({
                     class: [Array, Array, Array, Array, Array],
                     values: [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
                   },
                   {
                     class: [r.class, r[0].class, r[1].class, r[0][0].class, r[1][0].class],
                     values: r
                   })
    end
  end
end
