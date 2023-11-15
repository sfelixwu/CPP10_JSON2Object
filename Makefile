# Makefile for HW3 Web Report, ecs36b, f2020
#

CC = g++ -std=c++14
CFLAGS = -g -g -I/opt/homebrew/include

# CFLAGS = -g -Wall -Wstrict-prototypes
# CFLAGS = -O3

# CORE_INCS =	Core.h Transaction.h Person.h
# CORE_OBJS =	Core.o Transaction.o Person.o
# SHADOW_INCS = Shadow_Flight.h Shadow_Person.h
# SHADOW_OBJS = Shadow_Flight.o Shadow_Person.o 

LDFLAGS = -L/opt/homebrew/lib -ljsoncpp -lmicrohttpd -ljsonrpccpp-common -ljsonrpccpp-server -ljsonrpccpp-client -lcurl

# rules.
all: 	test_read test_write

#
#

ecs36b_JSON.o:		ecs36b_JSON.cpp ecs36b_Common.h
	$(CC) -c $(CFLAGS) ecs36b_JSON.cpp

JvTime.o:		JvTime.cpp JvTime.h
	$(CC) -c $(CFLAGS) JvTime.cpp

Core.o:		Core.cpp Core.h
	$(CC) -c $(CFLAGS) Core.cpp

GPS.o:		GPS.cpp GPS.h
	$(CC) -c $(CFLAGS) GPS.cpp

Labeled_GPS.o:	Labeled_GPS.cpp Labeled_GPS.h GPS.h
	$(CC) -c $(CFLAGS) Labeled_GPS.cpp

test_read.o:	test_read.cpp Labeled_GPS.h GPS.h
	$(CC) -c $(CFLAGS) test_read.cpp

test_write.o:	test_write.cpp Labeled_GPS.h GPS.h
	$(CC) -c $(CFLAGS) test_write.cpp

test_read:	test_read.o Labeled_GPS.o GPS.o Core.o ecs36b_JSON.o JvTime.o
	$(CC) -o test_read test_read.o Labeled_GPS.o GPS.o Core.o ecs36b_JSON.o JvTime.o $(LDFLAGS)

test_write:	test_write.o Labeled_GPS.o GPS.o Core.o ecs36b_JSON.o JvTime.o
	$(CC) -o test_write test_write.o Labeled_GPS.o GPS.o Core.o ecs36b_JSON.o JvTime.o $(LDFLAGS)

clean:
	rm -f *.o *~ core test_read test_write
