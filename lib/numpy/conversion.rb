module Numpy
  module Conversion
    module_function

    def to_ruby(val)
      case val
      when Numpy.integer
        PyCall.builtins.int.(val)
      when Numpy.floating
        PyCall.builtins.float.(val)
      when Numpy.complexfloating
        val = PyCall.builtins.complex.(val)
        Complex(val.real.to_f, val.imag.to_f)
      when Numpy.bool_
        PyCall.builtins.bool.(val)
      else
        val
      end
    end
  end

  Bool_ = Numpy.bool_
  Integer = Numpy.integer
  Floating = Numpy.floating
  ComplexFloating = Numpy.complexfloating

  [ Bool_, Integer, Floating, ComplexFloating ].each do |klass|
    klass.class_eval do
      register_python_type_mapping

      def self.wrap_pyptr(pyptr)
        Conversion.to_ruby(pyptr)
      end
    end
  end
end
