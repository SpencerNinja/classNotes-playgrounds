/*
 CONCURRENCY
 
 Grand Central Dispatch
    - What iOS uses to manage threads and concurrency
 
 LIFO = Last In First Out
 FIFO = First In First Out
 
 Serialized Queue
 ->4->3->2->1->
    - predictable
    - synchronous

 Concurrent Queue
 ->1->
 ->2->
 ->3->
 ->4->
    - unpredictable
    - asynchronous
    - faster
        - for "speed over order" scenarios
 
 What is a thread?
    - A sequence of instruction whose sequence is being scheduled by the OS that may be run in parallel with other threads
 
 Concurreny vs Parallelism
    - Concurrency is about dealing with many things at once (will not finish at the same time)
    - Parallelism is about doing many things at once (done at the same time)
 
 Queues
    - Work like they do in real life
        - like a line at the grocery store where you join the queue at the back of the line and move forward again and again until you're at the front where you checkout and leave the queue
    - Sometimes queues are serialized which means that they remove one piece of work from the front of the queue and complete it before going onto the next task
    - Sometimes they are concurrent, which means that they remove and execute multiple tasks at a time
 
 Conclusion: Threads are the individual slices of a program that do tasks, whereas queues are like pipelines of execution where we can request that work be done at some point. Queues are easier to think about than threads because they focus on what matters: ultimately, we don't care how some code runs on a CPU as long as it either runs in a particular order serially or not (concurrently).
    - You can create your own queues but normally you won't have to do so.
 
 */
