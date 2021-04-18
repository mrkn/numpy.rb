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
  end
end
