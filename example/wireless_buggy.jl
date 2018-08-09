#Pkg.add("JuliaBerry")
#Pkg.add("PyCall")
#Run with `sudo` -- needed for keyboard. 

using JuliaBerry
using JuliaBerry.ExplorerHat
using PyCall

@pyimport keyboard

function movef(x)
    forward(ExplorerHat.motor[1], 50)
    forward(ExplorerHat.motor[2], 50)
    sleep(x)
    stop(ExplorerHat.motor[1])
    stop(ExplorerHat.motor[2])
end

function moveb(x)
    on(ExplorerHat.led)
    backward(ExplorerHat.motor[1], 50)
    backward(ExplorerHat.motor[2], 50)
    sleep(x)
    stop(ExplorerHat.motor[1])
    stop(ExplorerHat.motor[2])
    on(ExplorerHat.led)
end

function movel(x)
    forward(ExplorerHat.motor[2], 75)
    forward(ExplorerHat.motor[1], 5)
    sleep(x)
    stop(ExplorerHat.motor[1])
    stop(ExplorerHat.motor[2])
end


function mover(x)
    forward(ExplorerHat.motor[2], 5)
    forward(ExplorerHat.motor[1], 75)
    sleep(x)
    stop(ExplorerHat.motor[1])
    stop(ExplorerHat.motor[2])
end

function movebl(x)
    explorerhat.light.on()
    backward(ExplorerHat.motor[2], 5)
    backward(ExplorerHat.motor[1], 75)
    sleep(x)
    stop(ExplorerHat.motor[1])
    stop(ExplorerHat.motor[2])
    explorerhat.light.off()
end

function movebr(x)
    explorerhat.light.on()
    backward(ExplorerHat.motor[2], 75)
    backward(ExplorerHat.motor[1], 5)
    sleep(x)
    stop(ExplorerHat.motor[1])
    stop(ExplorerHat.motor[2])
    explorerhat.light.off()

end

function square()
    for i in 1:4
        movef(3)
        mover(2)
    end
end

function eight()
    for i in 1:3
        movef(3)
        mover(2)
    end
    movef(6)
    for i in 1:3
        movel(2)
        movef(3)
    end
end

function disco(x)
    y = x/8
    forward(ExplorerHat.motor[1], 50)
    backward(ExplorerHat.motor[2], 50)
    for i in 1:8
        on(ExplorerHat.led)
        sleep(y)
        off(ExplorerHat.led)
        sleep(y)
    end
    stop(ExplorerHat.motor[1])
    stop(ExplorerHat.motor[2])
end

println("Starting main loop")
while true
    if keyboard.is_pressed("w")
        movef(0.01)
    elseif keyboard.is_pressed("a")
        movel(0.01)
    elseif keyboard.is_pressed("d")
        mover(0.01)
    elseif keyboard.is_pressed("s")
        moveb(0.01)
    elseif keyboard.is_pressed("z")
        movebl(0.01)
    elseif keyboard.is_pressed("c")
        movebr(0.01)
    elseif keyboard.is_pressed("4")
        square()
    elseif keyboard.is_pressed("8")
        eight()
    elseif keyboard.is_pressed("l")
        disco(7)
    elseif keyboard.is_pressed(" ")
        if is_on(ExplorerHat.output[1])
            off(ExplorerHat.output[1])
        else
            on(ExplorerHat.output[1])
        end
    end
end
