module ExplorerHat
import JuliaBerry.Motor
import JuliaBerry.LED
import JuliaBerry.OutputPin
import JuliaBerry.InputPin

# Onboard LEDs above 1, 2, 3, 4
const LED1 = 4
const LED2 = 17
const LED3 = 27
const LED4 = 5

# Outputs via ULN2003A
const OUT1 = 6
const OUT2 = 12
const OUT3 = 13
const OUT4 = 16

# 5v Tolerant Inputs
const IN1 = 23
const IN2 = 22
const IN3 = 24
const IN4 = 25

# Motor, via DRV8833PWP Dual H-Bridge
const M1B = 19
const M1F = 20
const M2B = 21
const M2F = 26

# Number of times to update
# pulsing LEDs per second
const PULSE_FPS = 50
const PULSE_FREQUENCY = 1000

const DEBOUNCE_TIME = 20

const CAP_PRODUCT_ID = 107

function __init__()
    global  motor = [
        Motor(M1F, M1B),
        Motor(M2F, M2B)
    ]

    global  led = [
        LED(LED1),
        LED(LED2),
        LED(LED3),
        LED(LED4)
    ]

    global  output = [
        OutputPin(OUT1),
        OutputPin(OUT2),
        OutputPin(OUT3),
        OutputPin(OUT4)
    ]

    global  input = [
        InputPin(OUT1),
        InputPin(OUT2),
        InputPin(OUT3),
        InputPin(OUT4)
    ]

end
end
