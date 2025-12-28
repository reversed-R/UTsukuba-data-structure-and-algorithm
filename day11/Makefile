COMPILE=typst
TARGET=repo
ROOT=..

build: $(TARGET).typ ../template.typ ../bxbibwrite.typ
	$(COMPILE) compile $(TARGET).typ --root $(ROOT)

image:
	. ./convert_images.sh
		
dijkstra:
	gcc c/main.c -o c/main.out

.PHONY: build image dijkstra
