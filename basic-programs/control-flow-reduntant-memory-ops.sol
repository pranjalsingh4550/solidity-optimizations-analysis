// SPDX-License-Identifier: UNLICENSED

contract test {
	function redundant_stores (int[] memory array) public pure {
		int a = array[3];
		int b = array[4];
		
		// using hex numbers to search in output asm/yul
		array[10] = 0x17500; // useless store, should be removed
		if (a > b)
			if (a > b + b)
				array[10] = 0x400;
			else
				array[10] = 0x800;
		else
			for (array[10] = 0; 0 == 1; b++) {
				array[11] = 0x100;
			}
		return;

	}

	function redundant_loads (int[] memory array) public pure {
		int a = array[0x12];
		int b = array[0x13];
		int c = array[0x13]; // c shouldn't be loaded again
		array[0x20] = a + b + c;	// artificially making the code not-dead
		return;
	}
}

