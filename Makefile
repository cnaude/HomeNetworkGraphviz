ts := $(shell /bin/date "+%Y-%m-%d %H:%M:%S")

all: dot png svg clean

dot:
	$(foreach var,$(shell ls *tmpl),sed "s/{{TIMESTAMP}}/$(ts)/g" $(var) > $$(echo $(var) | sed "s/.tmpl/.dot/g");)

png:
	$(foreach var,$(shell ls *dot),dot -Tpng $(var) -o $$(echo $(var) | sed "s/.dot/.png/g");)

svg:
	$(foreach var,$(shell ls *dot),dot -Tsvg $(var) -o $$(echo $(var) | sed "s/.dot/.svg/g");)

clean:
	rm *dot

