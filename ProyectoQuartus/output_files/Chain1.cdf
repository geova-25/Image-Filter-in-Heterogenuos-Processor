/* Quartus Prime Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(SOCVHPS) MfrSpec(OpMask(0));
	P ActionCode(Cfg)
		Device PartName(5CSEMA5F31) Path("/home/sebastian95/Documents/GitHub/Image-Filter-in-Heterogenuos-Processor/ProyectoQuartus/output_files/") File("MultiCore.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
