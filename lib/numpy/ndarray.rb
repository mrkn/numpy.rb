module Numpy
  NDArray = self.ndarray
  class NDArray
    register_python_type_mapping

    def [](*index)
      to_ruby(super)
    end

    private

    def to_ruby(val)
      case val
      when Numpy.integer
        val.to_i
      when Numpy.floating
        val.to_f
      when Numpy.complexfloating
        Complex(val.real.to_f, val.imag.to_f)
      when Numpy.bool_
        val.to_i == 1
      else
        val
      end
    end
  end
end
