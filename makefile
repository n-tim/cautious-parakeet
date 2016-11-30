cc=clang++
ld=clang++
mc=/usr/lib/x86_64-linux-gnu/qt5/bin/moc
cflags=-c -std=c++11 -Wall -fPIC
ldflags=-std=c++11

qt_includes=-I /usr/include/x86_64-linux-gnu/qt5

qt_libs=-licui18n -licuuc -licudata -lQt5Core -lQt5Gui -lQt5Qml -lQt5Quick 

libs=$(qt_libs)

target_dir=./data
source_dir=./sources
build_dir=./build

sources=main.cpp appHelper.cpp
moc_headers=appHelper.hpp

mocs=$(addprefix  $(build_dir)/moc_, $(moc_headers:.hpp=.cpp))

objects=$(mocs:.cpp=.o) $(addprefix  $(build_dir)/, $(sources:.cpp=.o))

include_path=-I $(source_dir) $(qt_includes)

target=cautious-parakeet

#pvs
pvs=pvs-studio
pvs_plog=plog-converter
pvs_config=pvs.cfg
pvs_output=temp/pvs-result

all:
	@echo 'me a baby'

rebuild: clean build

build:$(objects)
	@echo linking
	@mkdir -p $(target_dir)
	$(ld) $(ldflags) $(libs) $(objects) -o $(target_dir)/$(target)
	@printf %120s'\n' | tr " " "-"
	@echo pvs-studio analyze results:
	@$(pvs_plog) -t errorfile -s $(pvs_config) $(pvs_output)

$(build_dir)/%.o: $(source_dir)/%.cpp
	@echo compiling $<
	@mkdir -p $(dir $@)
	$(cc) $(cflags) $(include_path) -o $@ $<
	@mkdir -p $(dir $(pvs_output))
	$(pvs) --cfg $(pvs_config) --output-file $(pvs_output) --source-file $< --cl-params $(cflags) $(include_path) $<

$(build_dir)/%.o: $(build_dir)/%.cpp
	@echo compiling moc $<
	@mkdir -p $(dir $@)
	$(cc) $(cflags) $(include_path) -o $@ $<

$(build_dir)/moc_%.cpp: $(source_dir)/%.hpp
	@echo mocing $<
	@mkdir -p $(dir $@)
	$(mc) -o $@ $<

run:
	@clear
	@echo running $(target_dir)/$(target)
	@./$(target_dir)/$(target)

clean:
	@clear
	@echo cleaning
	@rm -rf $(build_dir)
	@rm -f $(pvs_output)