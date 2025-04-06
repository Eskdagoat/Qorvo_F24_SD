CFLAGS = -O3 -march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard

all: test_spi rffe_spi

# Main transceiver build 
test_spi: test_spi.c
	gcc $(CFLAGS) -o $@ $^ -lm -lpthread
	
rffe_spi: rffe_spi.c ADF4351.c
	gcc $(CFLAGS) -o $@ $^

clean:
	rm -f test_spi rffe_spi
