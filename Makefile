Target  = tutorial generic adding convoluted likelihood pull_dist
Objects = AtlasStyle.o AtlasUtils.o AtlasLabels.o
ROOTFLAGS = $(shell root-config --cflags)
ROOTLIBS  = $(shell root-config --libs)

all:$(Target)

tutorial: tutorial.cxx $(Objects)
	g++ -o $@ tutorial.cxx $(Objects) $(ROOTFLAGS) $(ROOTLIBS) -lRooFit -lRooFitCore

generic: generic.cxx $(Objects)
	g++ -o $@ generic.cxx $(Objects) $(ROOTFLAGS) $(ROOTLIBS) -lRooFit -lRooFitCore
	
adding: adding.cxx $(Objects)
	g++ -o $@ adding.cxx $(Objects) $(ROOTFLAGS) $(ROOTLIBS) -lRooFit -lRooFitCore
	
convoluted: convoluted.cxx $(Objects)
	g++ -o $@ convoluted.cxx $(Objects) $(ROOTFLAGS) $(ROOTLIBS) -lRooFit -lRooFitCore
	
likelihood: likelihood.cxx $(Objects)
	g++ -o $@ likelihood.cxx $(Objects) $(ROOTFLAGS) $(ROOTLIBS) -lRooFit -lRooFitCore
	
pull_dist: pull_dist.cxx $(Objects)
	g++ -o $@ pull_dist.cxx $(Objects) $(ROOTFLAGS) $(ROOTLIBS) -lRooFit -lRooFitCore

AtlasStyle.o: ATLAS/AtlasStyle.C ATLAS/AtlasStyle.h
	g++ -o $@  ATLAS/AtlasStyle.C -c $(ROOTFLAGS)

AtlasUtils.o: ATLAS/AtlasUtils.C ATLAS/AtlasUtils.h
	g++ -o $@  ATLAS/AtlasUtils.C -c $(ROOTFLAGS)

AtlasLabels.o: ATLAS/AtlasLabels.C ATLAS/AtlasLabels.h
	g++ -o $@  ATLAS/AtlasLabels.C -c $(ROOTFLAGS)

clean:
	rm -f tutorial generic adding convoluted likelihood pull_dist *.o Plots/* tutorial.html
