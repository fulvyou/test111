//
//  CThread.c
//  Thread
//
//  Created by Upixels_ on 17/6/21.
//  Copyright © 2017年 upixels. All rights reserved.
//

#include "CThread.h"
#include <pthread.h>

void *threadFun(void *userData);

void createCThread() {
    pthread_attr_t attr = {0};
    pthread_t pthreadID = 0;
    
    do {
        if (pthread_attr_init(&attr)) {
            printf("init failed!\n");
            break;
        }
        
        if (pthread_create(&pthreadID, &attr, threadFun, "Hello")) {
            printf("create thread failed!\n");
            break;
        }
        
        if (pthread_detach(pthreadID)) {
            printf("detach failed!\n");
            break;
        }
        
        if (pthread_attr_destroy(&attr)) {
            printf("destroy failed!\n");
            break;
        }
        
    } while (0);
    
}

void *threadFun(void *userData) {
    printf("userData:%p\n", userData);
    return NULL;
}
