// SPDX-License-Identifier: UNLICENSED

contract test {
	function simple_helper (int arg1) private pure returns (int) {
		int result;
		// Returns a known value, upon which we do arithmetic in the caller
		// To check if avoidable overflow/underflow checks are performed
		if (arg1 > 0x12345678)
			result = 0x87654321;
		else if (arg1 < -0x100)
			result = 0x700;
		result = result * 8;
		return result;
	}

	function unnecessary_overflow_checks(int[] memory array) public pure {
		int base = array[0x340];
		int retval = simple_helper (base)
		// We know there's no scope for overflow/underflow here.
		// Do the tools?
		array[0x340] = retval - 1;

		// Now we check if such optimizations are made intraprocedurally.

		if (retval > 0x1500) {
			if (retval < 0x3000) {
				retval = 0x2000;
				// We know there's no overflow/underflow problem here
				array[0x25] = retval + 0x100;
			}
		}
		return;

	}
}
