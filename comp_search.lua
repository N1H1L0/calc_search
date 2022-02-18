#!/usr/local/bin/lua

entries = {"laws of exponents", "multiplying powers with the same base", "median", "centroid", "circumcenter", "incenter", "angle bisector", "perpendicular bisector", "equidistant", "average rate of change", "instantaneous rate of change", "definition of derivative", "derivative of sin", "derivative of cos", "derivative of tan", "derivative of cot", "derivative of sec", "derivative of csc", "derivative of e to the x", "derivative of ln", "derivative of a to the x", "derivative of log", "derivative of an inverse function"}
-- Algebra 2
function laws_of_exponents() return "Available terms: multiplying powers with the same base" end --list all avaliable terns for laws of exponents in this function
function multiplying_mowers_with_the_same_base() return "When multiplying powers with the same base x^a+x^b=x^(a+b)" end

-- Geometry
function median() return "A line segment that joins a vertex and the midpoint of the opposite side of a triangle." end 
function centroid() return "The point where the 3 medians of a triangle intersect. Is located 2/3 down the median." end
function circumcenter() return "The point of concurrency of the three perpendicular bisectors of a triangle is called the circumcenter of the triangle" end 
function incenter() return "The point of concurrency of the three angle bisectors of a triangle is called the incenter of the triangle." end
function perpendicular_bisector() return "A segment, ray, line, or plane that is perpendicular to a segment at its midpoint is called perpendicular bisector." end
function angle_bisector() return "A ray that divides an angle into two equal angles." end
function equidistant() return "A point is equidistant from two figures if the point is the same distance from each figure." end


-- Pre-Calc


-- Calc
function average_rate_of_change() return "The formula for average rate of change is (f(b) - f(a)/(b - a)" end
function instantaneous_rate_of_change() return "Instantaneous rate of change is the same as the derivative of a function. The definition is as the limit of x approaches a: (f(x) - f(a))/(x - a)." end
function definition_of_derivative() return "The formal limit definition of derivative is as the limit of h approaches 0: (f(x + h) - f(x))/h." end
function derivative_of_sin() return "The derivative of sin(x) is cos(x)." end
function derivative_of_cos() return "The derivative of cos(x) is -sin(x)." end
function derivative_of_tan() return "The derivative of tan(x) is (sec(x))^2)." end
function derivative_of_cot() return "The derivative of cot(x) is -(csc(x))^2/" end 
function derivative_of_sec() return "The derivative of sec(x) is sec(x) * tan(x)." end 
function derivative_of_csc() return "The derivative of csc(x) is -csc(x) * cot(x)/" end
function derivative_of_e_to_the_x() return "The derivative of e^x is e^x." end
function derivative_of_ln() return "The derivative of ln(x) is 1/x." end 
function derivative_of_a_to_the_x() return "The derivative of a^x is ln(a) * a^x." end 
function derivative_of_log() return "The derivative of log base a of x is 1/(ln(a) * x)." end
function derivative_of_an_inverse_function() return "The derivative of f^-1(a) is 1/(f'(f^-1(a))." end 

function search(query)
  rank =  {}
  for i = 1, #entries do
    rank[i] = 0 
    for j = 1, string.len(query) do 
      if query:sub(j,j) == entries[i]:sub(j,j) then
        rank[i] = rank[i] + 300
      end
      for g = 1, string.len(entries[i]) do  
        if query:sub(j,j) == entries[i]:sub(g,g) then 
          rank[i] = rank[i] + 100
        end
      end
    end
  end 
  top1 = 0 
  top2 = 0 
  top3 = 0 
  top1_index = 0 
  top2_index = 0 
  top3_index = 0 
  for u = 1, #rank do  
    if rank[u] > top1 then 
      top3 = top2 
      top3_index = top2_index
      top2 = top1 
      top2_index = top1_index
      top1 = rank[u]
      top1_index = u    
    elseif rank[u] > top2 then
      top3 = top2 
      top3_index = top2_index
      top2 = rank[u]
      top2_index = u
    elseif rank[u] > top3 then
      top3 = rank[u]
      top3_index = u
    end
    end 
 if top3 < 700 then 
    result1 = entries[top1_index]
    result2 = entries[top2_index]
    result3 = "Result may not have been found for your query. If you would like to suggest an addition to (name of project) please visit our GitHub at (url) and open an issue or submit a pull request."
  else 
    result1  = entries[top1_index] 
    result2  = entries[top2_index] 
    result3  = entries[top3_index] 
  end 
  result1_def = result1:gsub("%s", "_")
  result2_def = result2:gsub("%s", "_")
  result3_def = result3:gsub("%s", "_")
  ans_1 = result1 .. ": " .. _G[result1_def]()
  ans_2 = result2 .. ": " .. _G[result2_def]()
  if result3 == "Result may not have been found for your query. If you would like to suggest an addition to (name of project) please visit our GitHub at (url) and open an issue or submit a pull request." then
    ans_3 = result3 
  else 
    ans_3 = result3 .. ": " .. _G[result3_def]()
  end
  string_length(ans_1)
  string_length(ans_2)
  string_length(ans_3)
  print_ledger[ledger_length] = "---------------------------------------------"
  ledger_length = ledger_length +1
end

----------------------------------------------
-- String Length bc calc display is weird
----------------------------------------------  
print_ledger= {}
ledger_length = 1
function string_length(input)
  if string.len(input) > 45 then 
    if string.len(input) % 45 == 0 then 
      times = string.len(input)/45
    else 
      times = 1 + string.len(input)/45 
    end
    line = {}
    w= 1

    -- use recursive function with if statements to loop through to the end of the thing.
    for r = 1, times do 
      line[r] = ""
      
      for s = 1 , 45 do
      --get substring 1-45 and separate into own string until ans_length then print on new line and repeat for the other answers
        line[r] = line[r]..input:sub(w,w)
        w= w+ 1
      end
    end
  end
  -- add to proper location in print ledger
  for i = 1, #line do
    print_ledger[ledger_length] = line[i]
    ledger_length = ledger_length + 1
   end
end

----------------------------------------------
-- only display 60 lines
----------------------------------------------
-- implemented only on calc version (comp version just prints the entire print_ledger
function show_ledger()
  print("---------------------------------------------------------------------------") 
  for j = 1, #print_ledger do
    print(print_ledger[j])
  end
end 

-----------------------------------------------
-- prompt for input and get entry
-----------------------------------------------
while true do 
  -- add error handling for nil value of text
  text = io.read()
  if text == nil or text == ""then 
    print_ledger[ledger_length] = "Input valid text before pressing enter."
  else 
    --add text to print ledger
    print_ledger[ledger_length] = text
    ledger_length = ledger_length +1
    search(text)
  end
  show_ledger()
end 

