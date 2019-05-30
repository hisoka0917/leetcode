package com.leetcode;

import java.util.HashMap;

public class MajorityElement {
    public int majorityElement(int[] nums) {
        HashMap<Integer,Integer> map = new HashMap<Integer, Integer>();
        Integer maxKey = null;
        Integer maxValue = 0;
        for (int i: nums) {
            Integer count = map.get(i);
            count = count != null ? count + 1 : 1;
            map.put(i, count);
            if (count > maxValue) {
                maxKey = i;
                maxValue = count;
            }
        }
        return maxKey;

        /*
        Arrays.sort(nums);
        return nums[nums.length/2];
         */
    }

    public static void main(String[] args) {
        MajorityElement solution = new MajorityElement();
        int[] nums = {2,2,1,1,1,2,2};
        System.out.println(solution.majorityElement(nums));
    }
}
