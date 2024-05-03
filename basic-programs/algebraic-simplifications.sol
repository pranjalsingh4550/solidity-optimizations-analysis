// SPDX-License-Identifier: UNLICENSED

contract test {
	function algebraic_simplifications (int[] memory array) public pure {
		int i = array[44];
		int k = i;
		int l = k + 1;
		int m = l + 1;
		int n = m * 1;
		int o = n * 2;
		o = o * 3;
		int p = o * 3;
		int q = p / 3;
		int r = q * 3;
		r = 5 * r * 6;

		array[46] = r;
		// using the array argument as a side effect, else this is dead code
		return ;
	}
	function algebraic_simplifications_clone (int[] memory array) public pure {
		int i = array[44];
		int k = i;
		int l = k + 1;
		int m = l + 1;	// m = k + 2
		int n = m * 1;	// n = 1
		int o = n * 2;	// lshift?
		o = o * 3;
		int p = o * 3;	// directly multiply by 9?
		int q = p / 3;	// this is a multiple of 3 so can optimize
		int r = q * 3;	// r = p even if not a multiple of 3
		r = 5 * r * 6;	// official documentation says this is converted
						// to r * 5 * 6

		array[46] = r;
		// using the array argument as a side effect, else this is dead code
		return ;
	}
}

