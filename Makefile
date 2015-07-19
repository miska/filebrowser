all: filebrowser.so

test: all
	${TNTNET} tntnet.xml

filebrowser.so: filebrowser.o folder.o file.o up.o trash.o home.o refresh.o
	${CXX} -o $@ $^ ${LDFLAGS}

folder.cpp: assets/open-iconic/svg/folder.svg
	${ECPPC} -m image/svg -n folder -b -o $@ $<

file.cpp: assets/open-iconic/svg/file.svg
	${ECPPC} -m image/svg -n file -b -o $@ $<

up.cpp: assets/open-iconic/svg/action-undo.svg
	${ECPPC} -m image/svg -n up -b -o $@ $<

trash.cpp: assets/open-iconic/svg/trash.svg
	${ECPPC} -m image/svg -n trash -b -o $@ $<

home.cpp: assets/open-iconic/svg/home.svg
	${ECPPC} -m image/svg -n home -b -o $@ $<

refresh.cpp: assets/open-iconic/svg/loop-circular.svg
	${ECPPC} -m image/svg -n refresh -b -o $@ $<

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
