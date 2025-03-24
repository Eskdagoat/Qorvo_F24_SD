CFLAGS = -O3 -march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard

all: sdr-transceiver setup sdr-rffe

# Main transceiver build (uses ADF4351 and transceiver logic)
sdr-transceiver: sdr-transceiver.c
	gcc $(CFLAGS) -o $@ $^ -lm -lpthread

# RF front-end controller build (separate tool or service)
sdr-rffe: sdr-rffe.c ADF4351.c
	gcc $(CFLAGS) -o $@ $^ -lm -lpthread

# Setup utility build
setup: setup.c
	gcc $(CFLAGS) -o $@ $^

clean:
	rm -f sdr-transceiver sdr-rffe setup

