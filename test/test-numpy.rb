class NumpyTest < Test::Unit::TestCase
  def test_VERSION
    assert_not_nil(Numpy::VERSION)
  end

  def test_Numpy_asarray
    assert_kind_of(Numpy::NDArray, Numpy.asarray([1]))
  end

  sub_test_case("scalar types conversion") do
    data({
      "Integer"    => [[1],        Integer],
      "Float"      => [[1.3],      Float],
      "Complex"    => [[1.3 + 1i], Complex],
      "TrueClass"  => [[true],     TrueClass],
      "FalseClass" => [[false],    FalseClass],
    }, keep: true)

    def test_aref(data)
      ary, klass = data
      assert_kind_of(klass, Numpy.asarray(ary)[0])
    end

    def test_asscalar(data)
      ary, klass = data
      assert_kind_of(klass, Numpy.asscalar(Numpy.asarray(ary)))
    end
  end

  sub_test_case("mean") do
    data("Float"   => [[0.0], nil,         0.0,      Float],
         "Integer" => [[0.0], :int32,      0,        Integer],
         "Complex" => [[0.0], :complex128, 0.0+0.0i, Complex])
    def test_float
      ary, dtype, expected, klass = data
      if dtype
        result = Numpy.mean(Numpy.asarray(ary), dtype: dtype)
      else
        result = Numpy.mean(Numpy.asarray(ary))
      end
      assert_equal({ kind_of: true,                   mean: expected },
                   { kind_of: result.kind_of?(klass), mean: result })
    end
  end
end
