prices = [17,3,6,9,15,8,6,1,10]

def stock_picker(prices)
    # variables needed to solve
    highest_profit = 0
    best_day_to_buy = 0
    best_day_to_sell = 0

    # loop through each price
    prices.each do |price|
        # current day = array index
        current_day = prices.index(price)

        # update array of future prices 
        future_prices = prices[current_day+1 .. -1]

        # compare each current price to future prices
        future_prices.each do |future_price|
            possible_profit = future_price - price
            future_days = future_prices.index(future_price)+1

            # update variables when the profit is higher
            if possible_profit > highest_profit
                highest_profit = possible_profit
                best_day_to_buy = current_day
                best_day_to_sell = best_day_to_buy + future_days
            end
        end
    end
    print [best_day_to_buy, best_day_to_sell]
end

stock_picker(prices)




#  =============================
# Key concepts

# Use NESTED LOOPS to compare multiple items in an array
# Re-write variables in loops to update result

# Maximum difference between two elements such that larger element appears after the smaller number

# Method 1 (Simple) 
#   Use nested loops. 
#   In the outer loop, pick elements one by one. 
#   In the inner loop calculate the difference of the picked element with every other element in the array.
#   Compare the difference with the maximum difference calculated so far. 

# Read more
#   https://www.geeksforgeeks.org/maximum-difference-between-two-elements/ 
#   https://www.enjoyalgorithms.com/blog/maximum-difference-between-two-elements