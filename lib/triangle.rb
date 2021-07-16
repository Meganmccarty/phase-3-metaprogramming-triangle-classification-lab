require 'pry'

class Triangle
    attr_accessor :side1, :side2, :side3, :sides_array

    def initialize(side1, side2, side3)
        @side1 = side1
        @side2 = side2
        @side3 = side3
        @sides_array = [side1, side2, side3]
    end

    def kind
        if sides_array.any?(&:negative?) || sides_array.any?(0)
            raise TriangleError
        elsif side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
            raise TriangleError
        else
            case @sides_array.uniq.length
            when 3
                :scalene
            when 2
                :isosceles
            when 1
                :equilateral
            end
        end    
    end

    class TriangleError < StandardError
        def message
            "There was an error when adding the lengths of your triangle's sides. Please make sure all values are greater than 0 and that the sides entered do not violate the law of triangle inequality"
        end
    end
end

equilateral_triangle = Triangle.new(10, 10, 10)
isosceles_triangle = Triangle.new(10, 10, 5)
scalene_triangle = Triangle.new(3, 4, 5)
invalid_triangle = Triangle.new(-3, 4, 4)

binding.pry
