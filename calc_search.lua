platform.apilevel = '1.0'

entries = {"Laws of Exponents", "Multiplying Powers with the same Base", "Median", "Centroid", "Circumcenter", "Incenter", "Angle Bisector", "Perpendicular Bisector", "Equidistant"}
-- Algebra 2
function Laws_of_Exponents() return "Available terms: Multiplying Powers with the same Base" end --put everything to do with laws of exponents in this var 
function Multiplying_Powers_with_the_same_Base() return "When multiplying powers with the same base x^a+x^b=x^(a+b)" end

-- Geometry
function Median() return "A line segment that joins a vertex and the midpoint of the opposite side of a triangle." end 
function Centroid() return "The point where the 3 medians of a triangle intersect. Is located 2/3 down the median." end
function Circumcenter() return "The point of concurrency of the three perpendicular bisectors of a triangle is called the Circumcenter of the triangle" end 
function Incenter() return "The point of concurrency of the three angle bisectors of a triangle is called the Incenter of the triangle." end
function Perpendicular_Bisector() return "A segment, ray, line, or plane that is perpendicular to a segment at its midpoint is called Perpendicular Bisector." end
function Angle_Bisector() return "A ray that divides an angle into two equal angles." end
function Equidistant() return "A point is Equidistant from two figures if the point is the same distance from each figure." end


-- Pre-Calc

-- Calc
function average_rate_of_change() return "The formula for average rate of change is (f(b) - f(a)/(b - a)" end
function instantaneous_rate_of_change() return "instantaneous rate of change is the same as the derivative of a function. The definition is as the limit of x approaches a: (f(x) - f(a))/(x - a)." end
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
function derivative_of_log_base_a_of_x() return "The derivative of log base a of x is 1/(ln(a) * x)." end

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
  print_ledger[ledger_length] = "-------------------------------------------------"
  ledger_length = ledger_length +1
end

----------------------------------------------
-- String Length bc calc display is weird (max char length in one line is 52)
----------------------------------------------  
print_ledger= {}
ledger_length = 1
function string_length(input)
  if string.len(input) > 52 then 
    if string.len(input) % 52 == 0 then 
      times = string.len(input)/52
    else 
      times = 1 + string.len(input)/52
    end
    line = {}
    w= 1

    -- use recursive function with if statements to loop through to the end of the thing.
    for r = 1, times do 
      line[r] = ""
      
      for s = 1 , 52 do
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

query = ""
screen_index = 1
screen = platform.window
-- should print some instructions when program is first opened

z = 1 
function on.paint(gc)
  --only display 14 lines max 
  if #print_ledger > 14 then
    for i = screen_index, screen_index + 13 do 
      gc:drawString(print_ledger[i], 0, (z * 15)) 
      z = z + 1
    end 
  else 
    for j = 1, #print_ledger do
      gc:drawString(print_ledger[j], 0, (j *15))
    end
  end
  z = 0
end
 
function on.charIn(char)
  query = query..char  
  print_ledger[ledger_length] = query  
  if #print_ledger > 14 then
    screen_index = #print_ledger - 13
  end
  screen:invalidate()
end

function on.backspaceKey()
  query = query:usub(0, -2)
  print_ledger[ledger_length] = query
  screen:invalidate()
end

function on.enterKey()
  if query == nil or query == ""then 
    print_ledger[ledger_length] = "Input valid text before pressing enter."
  else 
    ledger_length = ledger_length +1
    search(query)
    query = ""
  end
  if #print_ledger > 14 then
    screen_index = #print_ledger -13
  end 
  screen:invalidate()
end


function on.arrowUp()
  if #print_ledger > 14 and screen_index ~= 1 then
    screen_index = screen_index -1
    screen:invalidate()
  end
end

function on.arrowDown()
  if #print_ledger > 14 and screen_index < (#print_ledger - 13) then 
    screen_index = screen_index +1 
    screen:invalidate()
  end 
end

