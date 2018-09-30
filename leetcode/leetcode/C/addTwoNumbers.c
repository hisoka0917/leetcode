struct ListNode {
         int val;
         struct ListNode *next;
};

struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    struct ListNode *sumList = malloc(sizeof(struct ListNode));
    struct ListNode *pt = sumList;
    int sum = 0;
    int ten = 0;
    while (l1 || l2 || ten > 0) {
        int val1 = l1 ? l1->val : 0;
        int val2 = l2 ? l2->val : 0;
        sum = val1 + val2 + ten;
        ten = 0;
        if (sum >= 10) {
            ten = 1;
            sum -= 10;
        }
        struct ListNode *newNode = malloc(sizeof(struct ListNode));
        newNode->val = sum;
        pt->next = newNode;
        if (l1) {
            l1 = l1->next ? l1->next : NULL;
        }
        if (l2) {
            l2 = l2->next ? l2->next : NULL;
        }
        pt = newNode;
    }
    return sumList->next;
}
