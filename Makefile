ts := $(shell /bin/date "+%Y-%m-%d %H:%M:%S")

TEMPLATE=naude_network.dot.tmpl
DOT_FILE=naude_network.dot
OUT_FILE=naude_network.png
OUT_TYPE=png

all: dot png

dot: $($DOT_FILE)
	sed "s/{{TIMESTAMP}}/$(ts)/g" $(TEMPLATE) > $(DOT_FILE)

png: $(OUT_FILE)
	dot -T$(OUT_TYPE) $(DOT_FILE) -o $(OUT_FILE)
