-- Chopsticks by Differentions


--[[
Copyright (c) 2022 Vince Lin

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--



-- Bot Finger Variables

local botLeftHand = (1)
local botRightHand = (1)

-- Player Finger Variables

local playerLeftHand = (1)
local playerRightHand = (1)

-- Miscellaneous Variables

local line = ("----------------------------------------------------------------")
local space = (" ")

-- Miscellaneous Assignments

math.randomseed(os.time()) 

-- Main Functions

local function startingChopsticks()
    print(line)
    print("Welcome to chopsticks!")
    print("Bot's Chopsticks:")
    io.write(botLeftHand)
    io.write(space)
    io.write(botRightHand)
    print(space)
    print("Your Chopsticks:")
    io.write(playerLeftHand)
    io.write(space)
    io.write(playerRightHand)
    print(space)
    print("1: Attack left hand with left hand")
    print("2: Attack left hand with right hand")
    print("3: Attack right hand with left hand")
    print("4: Attack right hand with right hand")
    print(line)
end

local function getInput()
    local playerInput = io.read("*number")
    if playerInput == 1 then
        botLeftHand = (botLeftHand + playerLeftHand)
    elseif playerInput == 2 then
        botLeftHand = (botLeftHand + playerRightHand)
    elseif playerInput == 3 then
        botRightHand = (botRightHand + playerLeftHand)
    elseif playerInput == 4 then
        botRightHand = (botRightHand + playerRightHand)
    end
end

local function Chopsticks()
    print("Bot's Chopsticks:")
    io.write(botLeftHand)
    io.write(space)
    io.write(botRightHand)
    print(space)
    print("Your Chopsticks:")
    io.write(playerLeftHand)
    io.write(space)
    io.write(playerRightHand)
    print(space)
    print("1: Attack left hand with left hand")
    print("2: Attack left hand with right hand")
    print("3: Attack right hand with left hand")
    print("4: Attack right hand with right hand")
    print(line)
end

local function checkForExceededFingers()
    if playerLeftHand >= 5 then 
        playerLeftHand = 0
    end 
    if playerRightHand >= 5 then 
        playerRightHand = 0
    end 
    if botLeftHand >= 5 then 
        botLeftHand = 0
    end 
    if botRightHand >= 5 then 
        botRightHand = 0
    end 
end

-- Starting Functions

startingChopsticks()
getInput()

-- Game Loop 
while true do 
    Chopsticks()
    if botLeftHand and botRightHand == 0  then 
        print("You won!")
        os.exit()
    elseif playerLeftHand and playerRightHand == 0 then 
        print("You lost!")
        os.exit()
    end
    getInput() 
    checkForExceededFingers()
end