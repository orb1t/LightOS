////////////////////////////////////////////////////////
// Linker command file for BeagleBoard)
//
// Basic configuration using only external memory
//

-stack           0x00002000
-heap            0x00002000

MEMORY
{
	int_ram:	ORIGIN = 0x40200000		LENGTH = 0x0000FFFF
	ext_ddr:	ORIGIN = 0x82000000		LENGTH = 0x06000000
}

SECTIONS
{
	.const      > ext_ddr
	.bss        > ext_ddr
	.far        > ext_ddr

	.stack      > ext_ddr
	.data       > ext_ddr
	.cinit      > ext_ddr
	.cio        > ext_ddr


	.text       > ext_ddr
	.sysmem     > ext_ddr

	.irqstack	> ext_ddr
	.abortstack	> ext_ddr
	.svcstack	> ext_ddr
	.intvecs    > int_ram

}
