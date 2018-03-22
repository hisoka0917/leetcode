/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
 
struct ListNode* removeNthFromEnd(struct ListNode* head, int n) {
    if (!head->next && n==1) {
        // struct ListNode *empty = malloc(sizeof(struct ListNode));
        return head->next;
    }
    struct ListNode *tail = head;
    struct ListNode *beforeTarget = head;
    while (n > 0) {
        tail = tail->next;
        --n;
    }
    if (!tail) {
        struct ListNode *newList = head->next;
        return newList;
    }
    while (tail->next) {
         tail= tail->next;
         beforeTarget = beforeTarget->next;
    }
    struct ListNode* target = beforeTarget->next;
    if (target) {
        beforeTarget->next = target->next;
    }
     // free(target);
     return head;
}