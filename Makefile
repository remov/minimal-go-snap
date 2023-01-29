PROJ_NAME := minimal-go-snap
SNAP_ARCH := arm64

DATE := $(shell date +%Y-%m-%d)
REV := $(shell git describe --always --dirty)
VERSION := ${DATE}.${REV}


.PHONY: .FORCE build run clean dirs
.FORCE:

build: ${PROJ_NAME}_${VERSION}.snap

run:
	export BIND_ADDR=localhost:8080 STATIC_FILES=../web-static; cd go-source && go run main.go

clean:
	rm -rf squashfs-root *.snap *.tar

${PROJ_NAME}_${VERSION}.tar: squashfs-root
	tar vcf $@ --disable-copyfile -C $< .

%.snap: %.tar
	rm -f $@
	cat $< | sqfstar -no-xattrs -all-root -comp lzo $@
	@echo "\nBuilt $@"

squashfs-root: dirs squashfs-root/meta squashfs-root/help.sh squashfs-root/trampoline.sh squashfs-root/web-server squashfs-root/web-static

dirs:
	mkdir -p squashfs-root/meta/hooks

squashfs-root/meta: squashfs-root/meta/snap.yaml squashfs-root/meta/hooks

squashfs-root/meta/hooks: squashfs-root/meta/hooks/configure

squashfs-root/meta/snap.yaml: snap/snap.yaml .FORCE
	sed 's/$$VERSION/${VERSION}/g' $< | sed 's/$$ARCH/${SNAP_ARCH}/g' > $@

squashfs-root/meta/hooks/configure: snap/configure.sh
	cp $< $@

squashfs-root/%.sh: snap/%.sh
	cp $< $@

squashfs-root/web-server: $(wildcard go-source/*.go)
	cd go-source && GOOS=linux GOARCH=${SNAP_ARCH} go build -o ../$@
	chmod +x $@

squashfs-root/web-static: $(wildcard web-static/*)
	mkdir -p $@
	cp $? $@/
