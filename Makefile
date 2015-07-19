all: filebrowser.so

test: all
	${TNTNET} tntnet.xml

filebrowser.so: filebrowser.o folder.o file.o up.o trash.o home.o refresh.o
	${CXX} -o $@ $^ ${LDFLAGS}

folder.cpp: assets/open-iconic/png/folder-2x.png
	${ECPPC} -m image/png -n folder -b -o $@ $<

file.cpp: assets/open-iconic/png/file-2x.png
	${ECPPC} -m image/png -n file -b -o $@ $<

up.cpp: assets/open-iconic/png/action-undo-2x.png
	${ECPPC} -m image/png -n up -b -o $@ $<

trash.cpp: assets/open-iconic/png/trash-2x.png
	${ECPPC} -m image/png -n trash -b -o $@ $<

home.cpp: assets/open-iconic/png/home-2x.png
	${ECPPC} -m image/png -n home -b -o $@ $<

refresh.cpp: assets/open-iconic/png/loop-circular-2x.png
	${ECPPC} -m image/png -n refresh -b -o $@ $<

.SUFFIXES: .ecpp .gif .jpg .css .js .cpp
ECPPC=/usr/bin/ecppc
TNTNET=/usr/bin/tntnet
CXXFLAGS+=-I/usr/include -fPIC -O2 --std=c++14
LDFLAGS+=-shared -L/usr/lib64 -ltntnet -lcxxtools

.ecpp.cpp:
	${ECPPC} ${ECPPFLAGS} ${ECPPFLAGS_CPP} -o $@ $<
.gif.cpp:
	${ECPPC} ${ECPPFLAGS} -m image/gif ${ECPPFLAGS_GIF} -b -o $@ $<
.jpg.cpp:
	${ECPPC} ${ECPPFLAGS} -m image/jpg ${ECPPFLAGS_JPG} -b -o $@ $<
.png.cpp:
	${ECPPC} ${ECPPFLAGS} -m image/png ${ECPPFLAGS_PNG} -b -o $@ $<
.ico.cpp:
	${ECPPC} ${ECPPFLAGS} -m image/x-icon ${ECPPFLAGS_ICO} -b -o $@ $<
.css.cpp:
	${ECPPC} ${ECPPFLAGS} -m text/css ${ECPPFLAGS_CSS} -b -o $@ $<
.js.cpp:
	${ECPPC} ${ECPPFLAGS} -m application/javascript ${ECPPFLAGS_JS} -b -o $@ $<
