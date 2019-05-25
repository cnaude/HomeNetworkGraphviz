ts := $(shell /bin/date "+%Y-%m-%d %H:%M:%S")

OUT_TYPE=png

all: dot png clean

dot:
	$(foreach var,$(shell ls *tmpl),sed "s/{{TIMESTAMP}}/$(ts)/g" $(var) > $$(echo $(var) | sed "s/.tmpl/.dot/g");)

png:
	$(foreach var,$(shell ls *dot),dot -T$(OUT_TYPE) $(var) -o $$(echo $(var) | sed "s/.dot/.png/g");)

clean:
	rm *dot

