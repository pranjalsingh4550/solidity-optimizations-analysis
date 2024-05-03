// SPDX-License-Identifier: UNLICENSED

contract test {

	function partition_arr (uint[] memory array, uint left, uint right) public pure returns (uint) {
		// Separate the elements in array[left] to array[right] into those greater than
		// and less than the key.
		// We take the key to be array[left]
		// return new index of key
		uint i = left;
		for (i = left; i <= right; i ++) {
			if (array[i] < array[left]) {
				// cycle: array[left] -> array[left+1] -> array[i] -> array[left]
				// Expected optimization: don't load array[left] array[i] two times
				uint temp = array[left];
				array[left] = array[i];
				array[i] = array[left+1];
				array[left+1] = temp;
				left = left + 1;
			}
		}
		return left;
	}

	function qsort (uint[] memory array, uint begin, uint end) public pure {
		if (begin >= end)
			return ;
		uint res;
		res = 1;
		uint key_index;
		key_index = partition_arr (array, begin, end);
		if (key_index > 0)
			qsort (array, begin, key_index - 1);
		if (key_index < end)
			qsort (array, key_index + 1, end);
		return;
	}
}

