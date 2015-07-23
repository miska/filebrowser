all: filebrowser.so

test: all
	${TNTNET} tntnet.xml

filebrowser.so: main.o icons.o filebrowser.o jquery.o jquery-map.o
	${CXX} -o $@ $^ ${LDFLAGS}

up.svg: assets/open-iconic/svg/action-undo.svg
	cp $< $@
refresh.svg: assets/open-iconic/svg/loop-circular.svg
	cp $< $@

icons.cpp: assets/open-iconic/svg/folder.svg \
           assets/open-iconic/svg/file.svg \
		   up.svg \
           assets/open-iconic/svg/file.svg \
		   assets/open-iconic/svg/trash.svg \
		   assets/open-iconic/svg/home.svg \
		   refresh.svg
	${ECPPC} -v -n icons -bb -o $@ $^
	sed -i 's|"\(.*\.svg\)",|"/assets/icons/\1",|' $@

file.cpp: assets/open-iconic/svg/file.svg
	${ECPPC} -v -n file -b -o $@ $<

up.cpp: assets/open-iconic/svg/action-undo.svg
	${ECPPC} -v -n up -b -o $@ $<

trash.cpp: assets/open-iconic/svg/trash.svg
	${ECPPC} -v -n trash -b -o $@ $<

home.cpp: assets/open-iconic/svg/home.svg
	${ECPPC} -v -n home -b -o $@ $<

refresh.cpp: assets/open-iconic/svg/loop-circular.svg
	${ECPPC} -v -n refresh -b -o $@ $<

jquery.cpp: assets/js/jquery.min.js
	${ECPPC} -m application/javascript -n jquery -b -o $@ $<
jquery-map.cpp: assets/js/jquery.min.map
	${ECPPC} -m application/json -n jquery-map -b -o $@ $<

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
