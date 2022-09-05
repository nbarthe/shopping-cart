require 'json'
class Calculator
  def payment(*my_array)
  #defining a variable with 0 at the beginning
  to_pay = 0

  #checking if the array contains more than one Mac to apply special condition
  if my_array.count("AP1")>1

  #applying the discount if so
  to_pay += my_array.count("AP1")*(60*0.90)
  else
  to_pay += my_array.count("AP1")*60
  end

  #checking if array contains more than one Lenovo to apply special condition
  if my_array.count("LN1")>1
    #checking if the user is buying an even number of Lenovo or not to calculate import
   if my_array.count("LN1").even?
    to_pay += (my_array.count("LN1")/2)*(41)
   else
    to_pay += ((my_array.count("LN1")-1)/2)*(41) + 41
   end
  else
    to_pay += my_array.count("LN1") * 41
  end

  #adding the amount to pay if an hp computer is added to the cart as well
  to_pay += my_array.count("HP1")*39

  #converting amount to pay to string to use sprintf (most likeliy there is a better use but dont know it yet)
  to_pay_string = "%s" % to_pay
  JSON.generate(to_pay_string)
  end
end

#parse values coming from JSON
my_hash = JSON.parse('{"ids": ["AP1","LN1","LN1"]}')

#use the key to pass values to an array
my_array = my_hash["ids"]

