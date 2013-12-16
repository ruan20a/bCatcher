module ItemsHelper
  def currency(number)
    number_to_currency(number, :precision => 2, :unit => "$", :separator => ".")
  end
end
