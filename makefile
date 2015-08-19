###############################################################################
#                                                                             #
#                                                                             #
#  libmodbus :   https://github.com/stephane/libmodbus                        #
#                                                                             #
#                                                                             #
###############################################################################

OBJ_CATALOG=.obj/
DEPEND_CATALOG=.depend/

LIB=libmodbus.a
SOURCE=$(wildcard *.c)
OBJS=$(patsubst %.c,$(OBJ_CATALOG)%.o,$(SOURCE))
DEPEND=$(patsubst %.c,$(DEPEND_CATALOG)%.d,$(SOURCE))

AR=ar
CXX=gcc
CFLAGS=-g -Wall -I. 
ARFLAGS=sru

$(LIB):$(OBJS)
	$(AR) $(ARFLAGS) $@ $^ 

$(OBJ_CATALOG)%.o:%.c
	$(CXX) $(CFLAGS) -c $< -o $@

$(DEPEND_CATALOG)%.d:%.c
	$(CXX) -MM -I. $< | sed -e '1s/^/obj\//' > $@

include $(DEPEND)

.PHONY:clean
clean:
	-rm -f $(LIB) *~ $(OBJ_CATALOG)*.o $(DEPEND_CATALOG)*.d 

