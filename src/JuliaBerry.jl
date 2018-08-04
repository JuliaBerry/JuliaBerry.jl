module JuliaBerry
__precompile__(false)
using PiGPIO

export Pin, InputPin, OuputPin, 
	LED, Motor, forward, backward, speed, stop, on, off, is_on, is_off

# package code goes here

abstract type Thing
end

struct Pin <: Thing
    pin::Int

    function Pin(pin, mode)
        PiGPIO.set_mode(_pi[], pin, mode)
        new(pin)
    end
end

InputPin(pin) = Pin(pin, PiGPIO.INPUT)
OutputPin(pin) = Pin(pin, PiGPIO.OUTPUT)

struct LED <: Thing
    pin::Int

    function LED(pin)
        PiGPIO.set_mode(_pi[], pin, PiGPIO.OUTPUT)
        new(pin)
    end
end

function on(x::Thing)
    PiGPIO.write(_pi[], x.pin, 1)
end

function off(x::Thing)
    PiGPIO.write(_pi[], x.pin, 0)
end

on(x::Array{T}) where T<:Thing = on.(x)
off(x::Array{T}) where T<:Thing = off.(x)

is_off(x::Thing) = PiGPIO.read(_pi[], x.pin) == 0
is_on(x::Thing) = PiGPIO.read(_pi[], x.pin) == 1

struct Motor <: Thing
    fw_pin::Int
    bw_pin::Int

    function Motor(fw_pin, bw_pin)
        PiGPIO.set_mode(_pi[], fw_pin, PiGPIO.OUTPUT)
        PiGPIO.set_mode(_pi[], bw_pin, PiGPIO.OUTPUT)
        PiGPIO.set_PWM_range(_pi[], fw_pin, 100)
        PiGPIO.set_PWM_range(_pi[], bw_pin, 100)
        PiGPIO.set_PWM_dutycycle(_pi[], fw_pin, 0)
        PiGPIO.set_PWM_dutycycle(_pi[], bw_pin, 0)
	new(fw_pin, bw_pin)
    end
end

function speed(x::Motor, speed::Int=100)
    if speed>0
        forward(x, speed)
    elseif speed<0
        backward(x, abs(speed))
    end
end

function stop(x::Motor)
    PiGPIO.set_PWM_dutycycle(_pi[], x.fw_pin, 0)
    PiGPIO.set_PWM_dutycycle(_pi[], x.bw_pin, 0)
end

function forward(x::Motor, speed::Int)
    PiGPIO.set_PWM_dutycycle(_pi[], x.fw_pin, speed)
    PiGPIO.set_PWM_dutycycle(_pi[], x.bw_pin, 0)
end

function backward(x::Motor, speed::Int)
    PiGPIO.set_PWM_dutycycle(_pi[], x.fw_pin, 0)
    PiGPIO.set_PWM_dutycycle(_pi[], x.bw_pin, speed)
end

global const _pi = Ref{Pi}()
function __init__()
    _pi[] = Pi()
end
#TODO remove 
__init__()

setpi(p::Pi) = _pi[]=p


include("explorerhat.jl")
end # module
