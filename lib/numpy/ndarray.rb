module Numpy
  NDArray = self.ndarray
  class NDArray
    register_python_type_mapping

    def [](*index)
      Conversion.to_ruby(super)
    end

    def to_a
      recursive_to_a(tolist)
    end

    private def recursive_to_a(list)
      list.to_a.collect! {|l|
        case l
        when PyCall::List
          recursive_to_a(l)
        else
          l
        end
      }
    end

    def to_narray
      load_numo_narray

      # Suppress warning from PyCall
      begin
        save, $VERBOSE = $VERBOSE, nil
        dtype = self.dtype
      ensure
        $VERBOSE = save
      end

      _, narray_klass = self.class.narray_class_map.find { |dt, kl| dtype == dt }
      unless narray_klass
        raise TypeError,
              "Unable to convert numpy's %p array to Numo::NArray" % dtype
      end

      # TODO: Use MemoryView feature
      narray_klass[*to_a]
    end

    def self.narray_class_map
      @narray_class_map ||= [
        [ Numpy.int64   , Numo::Int64 ],
        [ Numpy.int32   , Numo::Int32 ],
        [ Numpy.int16   , Numo::Int16 ],
        [ Numpy.int8    , Numo::Int8 ],
        [ Numpy.uint64  , Numo::Int64 ],
        [ Numpy.uint32  , Numo::Int32 ],
        [ Numpy.uint16  , Numo::Int16 ],
        [ Numpy.uint8   , Numo::Int8 ],
        [ Numpy.bool8   , Numo::UInt8 ],
        [ Numpy.float32 , Numo::SFloat ],
        [ Numpy.float64 , Numo::DFloat ],
        [ Numpy.object  , Numo::RObject ]
      ].freeze
    end

    private def load_numo_narray
      begin
        require "numo/narray"
      rescue LoadError
        raise RuntimeError,
              "Unable to load numo/narray library; " +
              "please do gem install numo-narray before use to_narray method"
      end
    end
  end
end
