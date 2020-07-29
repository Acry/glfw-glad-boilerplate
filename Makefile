define colorecho
      @tput setaf 2
      @echo $1
      @tput sgr0
endef

CFLAGS     = -no-pie -ggdb -Wall -Wextra -mtune=native
LDFLAGS    = -lglfw -lm -ldl

TARGETS     = boing gears heightmap offscreen particles sharing splitview triangle wave windows

.PHONY: all
all: $(TARGETS)

boing: glad.c boing.c
	cc $(CFLAGS) -o $(LINUX_DIR)$@ $+ $(LDFLAGS)

gears: glad.c gears.c
	cc $(CFLAGS) -o $(LINUX_DIR)$@ $+ $(LDFLAGS)

heightmap: glad.c heightmap.c
	cc $(CFLAGS) -o $(LINUX_DIR)$@ $+ $(LDFLAGS)

offscreen: glad.c offscreen.c
	cc $(CFLAGS) -o $(LINUX_DIR)$@ $+ $(LDFLAGS)

particles: tinycthread.c glad.c particles.c
	cc $(CFLAGS) -o $(LINUX_DIR)$@ $+ $(LDFLAGS) -lpthread

sharing: glad.c sharing.c
	cc $(CFLAGS) -o $(LINUX_DIR)$@ $+ $(LDFLAGS)

splitview: glad.c splitview.c
	cc $(CFLAGS) -o $(LINUX_DIR)$@ $+ $(LDFLAGS)

triangle: glad.c triangle.c
	cc $(CFLAGS) -o $(LINUX_DIR)$@ $+ $(LDFLAGS)

wave: glad.c wave.c
	cc $(CFLAGS) -o $(LINUX_DIR)$@ $+ $(LDFLAGS)

windows: glad.c windows.c
	cc $(CFLAGS) -o $(LINUX_DIR)$@ $+ $(LDFLAGS)

.PHONY: clean
clean:
	@cd $(LINUX_DIR) && rm $(TARGETS) 2>/dev/null || true

# hot compile
# while inotifywait -e close_write ./code.c; do date +%X; make > /dev/null; done

#$<	first dependency
#$@	target name
#$+	list of all dependencies
#$^	list of all unique dependencies