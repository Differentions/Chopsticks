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

-- Miscellaneous Assignments

math.randomseed(os.time()) 

-- Bot Finger Variables

local botLeftHand = (1)
local botRightHand = (1)

-- Player Finger Variables

local playerLeftHand = (1)
local playerRightHand = (1)

-- Random AI Variables

local botRandMove = math.random(1, 4)

-- Miscellaneous Variables

local line = ("----------------------------------------------------------------")
local space = (" ")

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
        if botLeftHand == 0 then
            print("Not a valid option!")
            return
        else
            botLeftHand = (botLeftHand + playerLeftHand)
        end
    elseif playerInput == 2 then
        if botLeftHand == 0 then 
            print("Not a valid option!")
            return
        else
            botLeftHand = (botLeftHand + playerRightHand)
        end
    elseif playerInput == 3 then
        if botRightHand == 0 then
            print("Not a valid option!")
            return
        else
            botRightHand = (botRightHand + playerLeftHand)
        end
    elseif playerInput == 4 then
        if botRightHand == 0 then
            print("Not a valid option!")
            return
        else
            botRightHand = (botRightHand + playerRightHand)
        end
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

-- Random AI Functions

local function randBotMove()    
    if botRandMove == 1 then
        if playerLeftHand == 0 then 
            return
        else
            playerLeftHand = (playerLeftHand + botLeftHand)
        end
    elseif botRandMove == 2 then
        if playerLeftHand == 0 then 
            return
        else
            playerLeftHand = (playerLeftHand + botRightHand)
        end
    elseif botRandMove == 3 then
        if playerRightHand == 0 then
            return
        else
            playerRightHand = (playerRightHand + botLeftHand)
        end
    elseif botRandMove == 4 then
        if playerRightHand == 0 then
            return
        else
            playerRightHand = (playerRightHand + botRightHand)
        end
    end  
end

-- Starting Functions

startingChopsticks()
getInput()
randBotMove()

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
    randBotMove() 
    if botLeftHand and botRightHand == 0  then 
        print("You won!")
        os.exit()
    elseif playerLeftHand and playerRightHand == 0 then 
        print("You lost!")
        os.exit()
    end
    checkForExceededFingers()
end