/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number}
 */
var findMedianSortedArrays = function(nums1, nums2) {
    var mergeArray = [];
    let length1 = nums1.length;
    let length2 = nums2.length;
    let i=0;
    let j=0;
    while(i < length1 || j < length2) {
        let n1, n2;
        if(i < length1) {
            n1 = nums1[i];
        }
        if(j < length2) {
            n2 = nums2[j];
        }
        if (n1 !== undefined && n2 === undefined) {
            mergeArray.push(n1);
            i++;
        } else if (n1 === undefined && n2 !== undefined) {
            mergeArray.push(n2);
            j++;
        } else {
            if(n1 < n2) {
                mergeArray.push(n1);
                i++;
            } else {
                mergeArray.push(n2);
                j++;
            }
        }
        
    }
    let l = length1 + length2;
    if (l % 2 === 0) {
        return (mergeArray[l/2 - 1] + mergeArray[l/2]) / 2;
    } else {
        return mergeArray[Math.floor(l/2)];
    }
};