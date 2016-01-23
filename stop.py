import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BOARD)
GPIO.setwarnings(False)
GPIO.setup(5,GPIO.OUT)
GPIO.output(5,GPIO.HIGH)
GPIO.cleanup
print 'Mirror Ball Stopped'
