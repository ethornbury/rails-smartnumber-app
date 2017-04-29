class EvenNumber
    
# define a method named isEven;
# returns true if the number is even, false otherwise
    def self.isEven(number)   
        #the self is going to allow us to create a method 
        #without creating an object, 
        #saves on memory.
        if number % 2 == 0
            result = true
        else
            result = false
        end
        return result
    end
end
