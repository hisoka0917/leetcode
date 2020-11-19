//
//  BalancedBinaryTree.c
//  
//
//  Created by Kai Wang on 11/18/20.
//

#include <stdio.h>

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */

int max(int a, int b) {
    return a > b ? a : b;
}

int depth(struct TreeNode* root) {
    if (!root) {
        return 0;
    }

    return 1 + max(depth(root->left), depth(root->right));
}

bool isBalanced(struct TreeNode* root) {
    if (!root) {
        return true;
    }

    int left = depth(root->left);
    int right = depth(root->right);
    int diff = left - right;
    if (diff > 1 || diff < -1) {
        return false;
    }

    return isBalanced(root->left)&&isBalanced(root->right);
}
