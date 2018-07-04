module Numpy
  NDArray = self.ndarray
  class NDArray
    register_python_type_mapping

    def [](*index)
      Conversion.to_ruby(super)
    end
  end
end
