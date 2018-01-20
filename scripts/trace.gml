with(oConsole)
{
    ds_queue_enqueue(console_q,string(objectAge)+' '+string(argument0));
    //truncate_console();
    while(ds_queue_size(console_q)>24)
        ds_queue_dequeue(console_q);
}

//show_message(argument0);

