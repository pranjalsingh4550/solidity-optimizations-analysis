// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;


contract test {

	function partition_arr (uint[] memory array, uint left, uint right) public pure returns (uint) {
		// partition arr[left] to arr[right] by arr[left]'s s
		// return new index of key
		uint i = left;
		for (i = left; i <= right; i ++) {
			if (array[i] < array[left]) {
				// cycle
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
		qsort (array, begin, key_index - 1);
		qsort (array, key_index + 1, end);
		return;
	}
}

