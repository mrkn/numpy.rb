require "numpy/version"
require "pycall"

np = PyCall.import_module('numpy')
np::VERSION = Numpy::VERSION
Object.send :remove_const, :Numpy

Numpy = np
module Numpy
  CharArray = self.chararray
  CharArray.__send__ :register_python_type_mapping

  Memmap = self.memmap
  Memmap.__send__ :register_python_type_mapping

  Matrix = self.matrix
  Matrix.__send__ :register_python_type_mapping

  Poly1D = self.poly1d
  Poly1D.__send__ :register_python_type_mapping

  MA = self.ma
  module MA
    MaskedArray = self.MaskedArray
  end

  Polynomial = self.polynomial
  module Polynomial
    Chebyshev = self.chebyshev.Chebyshev
    Hermite = self.hermite.Hermite
    HermiteE = self.hermite_e.HermiteE
    Laguerre = self.laguerre.Laguerre
    Legendre = self.legendre.Legendre
    Polynomial = self.polynomial.Polynomial
  end
end

require 'numpy/conversion'
require 'numpy/ndarray'
