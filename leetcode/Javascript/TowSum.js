/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
    var map = new Map();
    for (var i = 0; i < nums.length; i++) {
        var complete = target - nums[i];
        if (map.has(complete)) {
            return [map.get(complete), i];
        }
        map.set(nums[i], i);
    }
};