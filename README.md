# JuliaBerry

An omnibus package with a high level API for controlling peripherals on the Raspberry Pi computer. Currently has support for the GPIO pins on the Pi, and the ExplorerHat. 

## GPIO

### Generic Pins

```
x = OutputPin(17)
on(x)
off(x)
```

### LED

```
x = LED(17)
on(x)
off(x)
```

### Motors

```
x = Motor(17, 23)
forward(x, 50)
stop(x)
backward(x, 50)
stop(x)
```

## Explorer Hat

```
using JuliaBerry.ExplorerHat

on(ExplorerHat.led[1])
on.(ExplorerHat.led)
off.(ExplorerHat.led)

on(ExploerHat.output[1])

forward(ExplorerHat.motor[1], 75)
stop(ExplorerHat.motor[1])
```
